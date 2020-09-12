import os
import sys
from pathlib import Path


def patched_register_readline() -> None:

    import atexit

    try:
        import readline
        import rlcompleter  # noqa: F401
    except ImportError:
        return

    readline_doc = getattr(readline, "__doc__", "")
    if readline_doc is not None and "libedit" in readline_doc:
        readline.parse_and_bind("bind ^I rl_complete")
    else:
        readline.parse_and_bind("tab: complete")

    try:
        readline.read_init_file()
    except OSError:
        pass

    if readline.get_current_history_length() == 0:
        xdg_dir = Path(os.environ["XDG_DATA_HOME"])
        if xdg_dir.is_dir():
            hist_dir = xdg_dir
        else:
            hist_dir = Path(os.path.expanduser("~"))
        history = str(hist_dir / "python_history")

        try:
            readline.read_history_file(history)
        except OSError:
            pass

        def write_history() -> None:
            try:
                readline.write_history_file(history)
            except OSError:
                pass

        atexit.register(write_history)


sys.__interactivehook__ = patched_register_readline  # type: ignore
