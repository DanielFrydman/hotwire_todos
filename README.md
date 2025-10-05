# Hotwire Todos - Real-time Collaborative Todo List

A modern, real-time collaborative todo list application built with Ruby on Rails 8 and Hotwire. This project demonstrates how to create interactive, real-time web applications using Rails' built-in Hotwire stack without writing custom JavaScript.

## ✨ Features

- **Real-time Updates**: See todos added, edited, and deleted by other users instantly
- **Collaborative**: Multiple users can work on the same todo list simultaneously
- **Modern UI**: Clean, responsive design built with Tailwind CSS
- **Turbo Frames**: Seamless editing experience without page refreshes
- **Broadcast Streams**: Real-time synchronization using Action Cable
- **User Attribution**: Each todo shows which user created it
- **Toggle Completion**: Quick one-click todo completion
- **CRUD Operations**: Full create, read, update, delete functionality

## 🚀 Tech Stack

- **Ruby on Rails 8.0.3** - Web framework
- **Hotwire** - Modern web framework for Rails
  - **Turbo** - SPA-like page acceleration
  - **Stimulus** - Modest JavaScript framework
- **PostgreSQL** - Database
- **Tailwind CSS** - Styling
- **Action Cable** - WebSocket connections for real-time features
- **Solid Queue** - Background job processing
- **Solid Cache** - Caching layer

## 🏗️ Architecture Highlights

### Real-time Implementation
The entire real-time functionality is implemented with just **3 lines of code** in the Todo model:

```ruby
after_create_commit { broadcast_prepend_to "todos", partial: "todos/todo", locals: { todo: self } }
after_update_commit { broadcast_replace_to "todos", partial: "todos/todo", locals: { todo: self } }
after_destroy_commit { broadcast_remove_to "todos" }
```

### Key Components
- **Turbo Streams**: Handle real-time DOM updates
- **Turbo Frames**: Enable seamless editing without page refreshes
- **Action Cable**: WebSocket connections for live updates
- **Broadcast Channels**: Automatic real-time synchronization

## 🛠️ Installation & Setup

### Prerequisites
- Ruby 3.3+ (see `.ruby-version`)
- PostgreSQL
- Node.js (for asset compilation)

### Getting Started

1. **Clone the repository**
   ```bash
   git clone git@github.com:DanielFrydman/hotwire_todos.git # or https://github.com/DanielFrydman/hotwire_todos.git
   cd hotwire_todos
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup the database**
   ```bash
   rails db:create db:migrate
   ```

4. **Start the development server**
   ```bash
   bin/dev
   ```

5. **Open your browser**
   Navigate to `http://localhost:3000`

## 🎯 Usage

### Basic Operations
- **Add a todo**: Type in the input field and click "Add Todo"
- **Complete a todo**: Click the circle/checkmark icon
- **Edit a todo**: Click the "Edit" button
- **Delete a todo**: Click the "Delete" button

### Real-time Collaboration
1. Open the application in multiple browser tabs or windows
2. Add, edit, or delete todos in one tab
3. Watch the changes appear instantly in other tabs
4. Each todo shows which user created it

## 🔧 Development

### Running Tests
```bash
rails test
```

### Code Quality
```bash
# Run RuboCop
bundle exec rubocop

# Run Brakeman security scanner
bundle exec brakeman
```

## 📁 Project Structure

```
app/
├── controllers/
│   └── todos_controller.rb    # Main controller with CRUD operations
├── models/
│   └── todo.rb                # Model with real-time broadcasts
├── views/
│   └── todos/
│       ├── index.html.erb     # Main todo list view
│       ├── _todo.html.erb     # Todo partial with Turbo Frame
│       └── edit.html.erb      # Edit form
└── javascript/
    └── controllers/           # Stimulus controllers
```

## 🌟 Hotwire Magic

This application showcases several Hotwire features:

### Turbo Streams
- Automatic real-time updates when todos are created, updated, or deleted
- No custom JavaScript required
- Seamless integration with Rails conventions

### Turbo Frames
- Edit forms load without page refreshes
- Form submissions update only the relevant part of the page
- Maintains application state during interactions

### Action Cable Integration
- WebSocket connections established automatically
- Broadcast channels handle real-time communication
- Users see changes from other users instantly

## 🙏 Acknowledgments

- Built with [Ruby on Rails](https://rubyonrails.org/)
- Powered by [Hotwire](https://hotwired.dev/)
- Styled with [Tailwind CSS](https://tailwindcss.com/)
- Inspired by modern real-time web applications

---

**Note**: This is a demonstration project showcasing Rails 8 and Hotwire capabilities. The real-time functionality requires WebSocket support, which is available in modern browsers and development servers.
