# -*- coding: utf-8 -*-
# Copyright (c) 2016, Dmitry Marienko
# All rights reserved.
# See LICENSE.txt for details.
import os
import re
import time
from . import subprocess_repl



# KDB/Q in interactive mode shows no prompt, so we must hold it by hand.

class KdbRepl(subprocess_repl.SubprocessRepl):
    TYPE = "kdb"

    def __init__(self, encoding, **kwds):
        super(KdbRepl, self).__init__(encoding, **kwds)

        # Using this to detect whether KDB returns some output or it needs more input
        # KDB in interactive mode doesn't show prompt, so we must hold it by hand
        # It's a hack and, for example, we can send '1 "> "; "' with no output
        self.got_output = True
        self.multiline = False

        self.prompt()


    def read_bytes(self):
        result = super(KdbRepl, self).read_bytes()

        # special case for linux
        st = result.decode("utf-8")
        if st.startswith("> ") and st.endswith("\n"):
            self.got_output = True
            self.multiline = False
            self.prompt()
            return result[2:]

        # Consumes output (it must be equal to PREPENDER)
        if result and not self.got_output:
            self.got_output = True
            self.multiline = False
            self.prompt()
            # Don't return PREPENDER and space, read another input
            # super(KdbRepl, self).read_bytes()
            return self.read_bytes()

        return result

    def write_bytes(self, bytes):
        # Drop flag on new input
        st = bytes.decode("utf-8")

        if st.startswith('\\'):
            self.do_write(b'\\' + bytes[1:] + b'\n\n')
            self.prompt()
            return

        self.got_output = False
        if not self.multiline:
            # Turn multiline mode on, it will be turned off, when KDB returns some output
            self.multiline = True
            self.prepend()

        self.do_write(bytes)

    def do_write(self, bytes):
        super(KdbRepl, self).write_bytes(bytes)

    def prompt(self):
        """ Sends command to get prompt """
        self.do_write(b'1 "> ";\n')

    def prepend(self):
        """ Command to prepend every output with special mark to detect multiline mode """
        self.do_write(b'1 "> ";')
