```markdown
# Pokémon Legends Sticky Bot

A highly customizable Discord bot designed for the Pokémon Legends community. This bot ensures important messages remain visible in your Discord channels by periodically reposting them as sticky messages.

## Features

- **Sticky Messages:** Ensure important messages stay at the bottom of the channel.
- **Customizable Embeds:** Set the color, image, title, and content of sticky messages.
- **Permission Management:** Restrict command access based on user roles.
- **Clean Chat:** Automatically delete command messages after processing to maintain a clean chat environment.
- **Persistent Storage:** Maintain the last sticky message ID to ensure proper cleanup on bot restart.

## Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) (v16.6.0 or higher)
- [npm](https://www.npmjs.com/) (v7.20.0 or higher)
- MySQL database

### Installation

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/yourusername/pokemon-legends-sticky-bot.git
    cd pokemon-legends-sticky-bot
    ```

2. **Install Dependencies:**

    ```bash
    npm install
    ```

3. **Configure Environment Variables:**

    Create a `.env` file in the root directory and add your Discord bot token:

    ```env
    DISCORD_TOKEN=your-discord-bot-token
    ```

4. **Setup MySQL Database:**

    Update the MySQL database connection details in the `index.js` file:

    ```javascript
    const db = createPool({
        host: 'your-database-host',
        user: 'your-database-user',
        password: 'your-database-password',
        database: 'your-database-name',
    });
    ```

5. **Create `LastPost.json`:**

    Create a `LastPost.json` file in the root directory:

    ```json
    {}
    ```

### Running the Bot

Start the bot using the following command:

```bash
node index.js
```

## Commands

- `!help` - Display the available commands.
- `!setcolor <color>` - Set the embed color for sticky messages.
- `!setimage <imageURL>` - Set the embed image for sticky messages.
- `!settitle <title>` - Set the title for sticky messages.
- `!stick <message>` - Stick a message to the channel.
- `!unstick` - Unstick the current sticky message.

### Permissions

Commands are restricted to users with specific roles. Update the `allowedRoles` array in `index.js` with the role IDs that are allowed to use the commands:

```javascript
const allowedRoles = ['role-id-1', 'role-id-2', 'role-id-3'];
```

## Contributing

We welcome contributions to enhance the Pokémon Legends Sticky Bot. To contribute:

1. **Fork the repository.**
2. **Create a new branch:** `git checkout -b feature-branch`.
3. **Make your changes.**
4. **Commit your changes:** `git commit -am 'Add new feature'`.
5. **Push to the branch:** `git push origin feature-branch`.
6. **Create a new Pull Request.**

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

<p align="center">
  <img src="https://i.imgur.com/NyAz7sw.png" alt="Pokémon Legends" width="150"/>
</p>
```
