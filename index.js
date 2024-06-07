require('dotenv').config();
const { Client, Intents, MessageEmbed } = require('discord.js');
const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');

const client = new Client({
    intents: [
        Intents.FLAGS.GUILDS,
        Intents.FLAGS.GUILD_MESSAGES,
    ],
});

const db = mysql.createPool({
    uri: process.env.DB_URI,
});

const PREFIX = '!'; // Set your desired prefix here

let lastStickyMessageSent = new Map();
let lastStickyMessageID = new Map();

// Load last sticky message IDs from LastPost.json
const lastPostFilePath = path.resolve(__dirname, 'LastPost.json');
if (fs.existsSync(lastPostFilePath)) {
    try {
        const lastPostData = JSON.parse(fs.readFileSync(lastPostFilePath, 'utf-8'));
        for (const [channelID, messageID] of Object.entries(lastPostData)) {
            lastStickyMessageID.set(channelID, messageID);
        }
    } catch (error) {
        console.error('Error reading LastPost.json:', error);
    }
}

const allowedRoles = ['1095061892931797084', '1171580814656557137', 'Role ID 3']; // Add your second role ID here

const embedFooter = {
    text: '© 2022 - 2024 Pokémon Legends',
    iconURL: 'https://i.imgur.com/NyAz7sw.png'
};

client.once('ready', () => {
    console.log(`MySQL Database Connected!`);
    console.log(`Logged in as ${client.user.tag}!`);
});

client.on('messageCreate', async (message) => {
    try {
        const channelID = message.channel.id;

        // Check if the sticky message needs to be reposted after 5 seconds
        if (!lastStickyMessageSent.has(channelID) || Date.now() - lastStickyMessageSent.get(channelID) > 5000) {
            fetchStickyMessage(channelID, message.channel);
            lastStickyMessageSent.set(channelID, Date.now());
        }

        if (message.content.startsWith(PREFIX)) {
            const args = message.content.slice(PREFIX.length).trim().split(/ +/);
            const command = args.shift().toLowerCase();

            switch (command) {
                case 'help':
                    sendHelpMessage(message);
                    break;
                case 'setcolor':
                    handleSetColorCommand(message, args);
                    break;
                case 'setimage':
                    handleSetImageCommand(message, args);
                    break;
                case 'settitle':
                    handleSetTitleCommand(message, args);
                    break;
                case 'stick':
                    handleStickCommand(message, args);
                    break;
                case 'unstick':
                    handleUnstickCommand(message);
                    break;
            }

            message.delete(); // Delete the command message after processing
        }
    } catch (error) {
        console.error('Error executing command:', error);
    }
});

async function fetchStickyMessage(channelID, channel) {
    try {
        const [rows] = await db.query('SELECT message_content, embed_color, embed_image, title FROM sticky_messages WHERE channel_id = ? LIMIT 1', [channelID]);
        if (rows.length > 0) {
            const { message_content, embed_color = '#0099ff', embed_image, title = 'Professor Turo' } = rows[0];

            // Ensure the title is a string
            const embedTitle = typeof title === 'string' ? title : 'Professor Turo';

            const embed = new MessageEmbed()
                .setColor(embed_color)
                .setTitle(embedTitle)
                .setDescription(message_content)
                .setThumbnail(embed_image)
                .setFooter(embedFooter);

            if (lastStickyMessageID.has(channelID)) {
                const previousStickyMessageID = lastStickyMessageID.get(channelID);
                try {
                    const previousStickyMessage = await channel.messages.fetch(previousStickyMessageID);
                    if (previousStickyMessage && previousStickyMessage.author.bot) {
                        await previousStickyMessage.delete();
                    }
                } catch (fetchError) {
                    //console.warn(`Warning: Unable to fetch or delete previous sticky message: ${fetchError.message}`);
                    // If the message fetch fails, remove it from the map
                    lastStickyMessageID.delete(channelID);
                }
            }

            const newStickyMessage = await channel.send({ embeds: [embed] });
            lastStickyMessageID.set(channelID, newStickyMessage.id);
            saveLastStickyMessageID(channelID, newStickyMessage.id);
        }
    } catch (error) {
        console.error('Error fetching sticky message:', error);
    }
}

function saveLastStickyMessageID(channelID, messageID) {
    let lastPostData = {};
    try {
        lastPostData = JSON.parse(fs.readFileSync(lastPostFilePath, 'utf-8'));
    } catch (error) {
        console.error('Error reading LastPost.json during save:', error);
    }
    lastPostData[channelID] = messageID;
    fs.writeFileSync(lastPostFilePath, JSON.stringify(lastPostData, null, 2));
}


async function handleSetColorCommand(message, args) {
    const color = args[0];
    const channelID = message.channel.id;

    if (!message.member.roles.cache.some(role => allowedRoles.includes(role.id))) {
        return message.reply('You do not have permission to use this command.');
    }

    try {
        await db.execute('UPDATE sticky_messages SET embed_color = ? WHERE channel_id = ?', [color, channelID]);
        message.channel.send('Embed color updated successfully!');
    } catch (error) {
        console.error('Error updating embed color:', error);
        message.channel.send('There was an error updating the embed color.');
    }
}

async function handleSetImageCommand(message, args) {
    const imageURL = args[0];
    const channelID = message.channel.id;

    if (!message.member.roles.cache.some(role => allowedRoles.includes(role.id))) {
        return message.reply('You do not have permission to use this command.');
    }

    try {
        await db.execute('UPDATE sticky_messages SET embed_image = ? WHERE channel_id = ?', [imageURL, channelID]);
        message.channel.send('Embed image updated successfully!');
    } catch (error) {
        console.error('Error updating embed image:', error);
        message.channel.send('There was an error updating the embed image.');
    }
}

async function handleSetTitleCommand(message, args) {
    const newTitle = args.join(' ');
    const channelID = message.channel.id;

    if (!message.member.roles.cache.some(role => allowedRoles.includes(role.id))) {
        return message.reply('You do not have permission to use this command.');
    }

    try {
        await db.execute('UPDATE sticky_messages SET title = ? WHERE channel_id = ?', [newTitle, channelID]);
        message.channel.send('Sticky message title updated successfully!');
    } catch (error) {
        console.error('Error updating sticky message title:', error);
        message.channel.send('There was an error updating the sticky message title.');
    }
}

async function handleStickCommand(message, args) {
    const stickyMessage = args.join(' ');
    const channelID = message.channel.id;

    if (!message.member.roles.cache.some(role => allowedRoles.includes(role.id))) {
        return message.reply('You do not have permission to use this command.');
    }

    try {
        await db.execute('INSERT INTO sticky_messages (channel_id, message_content) VALUES (?, ?) ON DUPLICATE KEY UPDATE message_content = ?', [channelID, stickyMessage, stickyMessage]);
        message.channel.send('Sticky message updated successfully!');
    } catch (error) {
        console.error('Error updating sticky message:', error);
        message.channel.send('There was an error updating the sticky message.');
    }
}

async function handleUnstickCommand(message) {
    const channelID = message.channel.id;

    if (!message.member.roles.cache.some(role => allowedRoles.includes(role.id))) {
        return message.reply('You do not have permission to use this command.');
    }

    try {
        await db.execute('DELETE FROM sticky_messages WHERE channel_id = ?', [channelID]);
        message.channel.send('Sticky message removed successfully!');
    } catch (error) {
        console.error('Error removing sticky message:', error);
        message.channel.send('There was an error removing the sticky message.');
    }
}

function sendHelpMessage(message) {
    const embed = new MessageEmbed()
        .setColor('#0099ff')
        .setTitle('Sticky Bot Commands')
        .setDescription('Here are the available commands:')
        .addFields(
            { name: '!setcolor <color>', value: 'Set the embed color for sticky messages.' },
            { name: '!setimage <imageURL>', value: 'Set the embed image for sticky messages.' },
            { name: '!settitle <title>', value: 'Set the title for sticky messages.' },
            { name: '!stick <message>', value: 'Stick a message to the channel.' },
            { name: '!unstick', value: 'Unstick the current sticky message.' }
        )
        .setFooter(embedFooter);

    message.channel.send({ embeds: [embed] });
}

client.login(process.env.DISCORD_TOKEN);
