#!/usr/bin/env python3

import sys
from ansible.cli.playbook import PlaybookCLI


# TODO: QA
# * https://stackoverflow.com/a/68548205
def main():
    cli = PlaybookCLI(sys.argv)
    cli.run()


if __name__ == "__main__":
    main()
