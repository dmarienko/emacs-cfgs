import sublime, sublime_plugin

class OpenTreeCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.window.run_command("toggle_side_bar")
        self.window.run_command("focus_side_bar")
