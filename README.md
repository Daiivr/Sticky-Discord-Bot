# Sticky Message Bot

This Discord bot automatically manages sticky messages in your server's channels, ensuring that important information is always visible to your members. The bot allows users with specific roles to set, update, and remove sticky messages, as well as customize the appearance of these messages using commands.

## Features

- Sticky messages that persist at the top of the channel
- Customizable embed color, image, and title
- Role-based permissions for command usage
- Commands for setting, updating, and removing sticky messages
- Help command to list all available commands

## Prerequisites

Before running the bot, ensure you have the following:

- Node.js installed
- A Discord bot token
- MySQL database set up

## Installation

1. Clone the repository:

   ```bash
   git clone <repository_url>
   cd <repository_directory>
   ```

2. Install dependencies:

   ```bash
   npm install
   ```

3. Set up environment variables:

   Create a `.env` file in the root directory and add your Discord bot token and MySQL database URI:

   ```
   DISCORD_TOKEN=your_discord_bot_token
   DB_URI=your_mysql_database_uri
   ```

4. Set up the database:

   Ensure your MySQL database has a table named `sticky_messages` with the following schema:

   ```sql
   CREATE TABLE sticky_messages (
       channel_id VARCHAR(255) PRIMARY KEY,
       message_content TEXT,
       embed_color VARCHAR(7) DEFAULT '#0099ff',
       embed_image VARCHAR(255),
       title VARCHAR(255) DEFAULT 'Professor Turo'
   );
   ```

5. Start the bot:

   ```bash
   node index.js
   ```

## Usage

The bot uses the command prefix `!`. The following commands are available:

- `!help`: Displays a list of available commands.
- `!setcolor <color>`: Sets the embed color for sticky messages (requires appropriate role).
- `!setimage <imageURL>`: Sets the embed image for sticky messages (requires appropriate role).
- `!settitle <title>`: Sets the title for sticky messages (requires appropriate role).
- `!stick <message>`: Sticks a message to the channel (requires appropriate role).
- `!unstick`: Unsticks the current sticky message (requires appropriate role).

### Role-Based Permissions

Ensure the roles that are allowed to use the commands are set in the `allowedRoles` array in the code:

```js
const allowedRoles = ['Role ID 1', 'Role ID 2', 'Role ID 3'];
```

Replace the role IDs with the actual IDs of the roles in your server.

## Configuration

- **Command Prefix**: Change the command prefix by modifying the `PREFIX` variable in the code.
- **Embed Footer**: Customize the footer of the embed messages by editing the `embedFooter` object in the code.

## Troubleshooting

- If the bot doesn't respond to commands, check the console for any errors.
- Ensure that the bot has the necessary permissions to read messages and send messages in the channels.
- Verify that the `.env` file is correctly set up with your Discord token and database URI.
- Check the `LastPost.json` file for any errors during the read/write operations.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Feel free to open issues or submit pull requests for improvements and bug fixes.

---

Enjoy using the Sticky Message Bot! If you have any questions or need further assistance, please reach out.
