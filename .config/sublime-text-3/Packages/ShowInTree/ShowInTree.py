import sublime, sublime_plugin

class ShowInTreeCommand(sublime_plugin.WindowCommand):
    def run(self):
    	# self.view.insert(edit, 0, "Hello, World!")
        self.window.run_command("reveal_in_side_bar")
        # self.window.run_command("toggle_side_bar")
        self.window.run_command("focus_side_bar")