local opts = {
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = "",
    },
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  force_buffers = true,
  icons = {
    collapsed = "",
    current_frame = "",
    expanded = "",
  },
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.50 },
        { id = "stacks", size = 0.30 },
        { id = "watches", size = 0.10 },
        { id = "breakpoints", size = 0.10 },
      },
      size = 40,
      position = "left", -- Can be "left" or "right"
    },
    {
      elements = { "repl", "console" },
      size = 10,
      position = "bottom", -- Can be "bottom" or "top"
    },
  },
  mappings = {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t",
  },
  render = {
    indent = 1,
    max_value_lines = 100,
  },
}

  local dap = require("dap")
  require("dapui").setup(opts)

  -- Open DAP UI when a debugging session is initialized
  dap.listeners.after.event_initialized["dapui_config"] = function()
    require("dapui").open()
  end

  -- Optional: Commented out to prevent automatic UI closing
  dap.listeners.before.event_terminated["dapui_config"] = function()
    -- require("dapui").close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    -- require("dapui").close()
  end

  -- Add language-specific DAP configurations
  dap.configurations.java = {
    {
      name = "Debug Launch (2GB)",
      type = "java",
      request = "launch",
      vmArgs = "-Xmx2g ",
    },
    {
      name = "Debug Attach (8000)",
      type = "java",
      request = "attach",
      hostName = "127.0.0.1",
      port = 8000,
    },
    {
      name = "Debug Attach (5005)",
      type = "java",
      request = "attach",
      hostName = "127.0.0.1",
      port = 5005,
    },
    {
      name = "My Custom Java Run Configuration",
      type = "java",
      request = "launch",
      -- Extend the classPath to list your dependencies.
      -- classPaths = {},

      -- If using multi-module projects, provide the project name.
      -- projectName = "yourProjectName",

      -- javaExec = "java",
      mainClass = "replace.with.your.fully.qualified.MainClass",

      -- If using the JDK9+ module system, extend this.
      -- modulePaths = {},
      vmArgs = "-Xmx2g ",
    },
  }

    -- Configure the Python adapter
  dap.adapters.python = {
    type = "executable",
    command = "python", -- Change to "python3" if needed
    args = { "-m", "debugpy.adapter" },
  }

  -- Define Python debugging configurations
dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch File",
        program = "${file}", -- Runs the current file
        pythonPath = function()
            return "python" -- Modify if you use a virtual environment
        end,
    },
    {
        type = "python",
        request = "attach",
        name = "Attach to Process",
        connect = {
            host = "127.0.0.1",
            port = 5678,
        },
    },
}
return { opts = opts, config = config }
