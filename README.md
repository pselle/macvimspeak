# MacVimSpeak

MacVimSpeak is an OS X app that allows you to "say" Vim commands and the app will execute the corresponding key mappings for Vim. This is also a good way to learn about Vim, because those simple keystroke commands map to words! (ex. a for after, A for after [end of] a line).

To use the app:

1.  Download and install the app in your favorite way
2.  Run the app, it will be red with a "Start Listening" button
3.  Clicking on "Start Listening" puts the app into an active state, and now when you say
    commands, ex. "down 3", the keycodes will be executed. IMPORTANT: once you "start listening" change focus from MacVimSpeak to your chosen flavor of Vim! (terminal, MacVim, Sublime with Vim bindings, etc.)
4.  At any time, to stop keystrokes, say "Shush" and the app will sleep, and "Wake up" will 
    wake it up again. The "Stop Listening" button halts speech recognition, and you'll need to click it again to turn speech recognition on again.

### Notes

It's a good idea using this to turn on show commands in your Vim setup, so you can see the keys that Vim sees.
`:set showcmd` from Vim, or `set showcmd` from your `.vimrc` or `gvimrc`.

You may need to download some (all native) OS X accessibility tools for your machine to run app if you haven't used native dictation before.

### Authors, Contributors, and Credits
Developed by @pselle. This project is largely inspired by (and is essentially a Mac port of) Ashley Feniello (@AshleyF)'s [VimSpeak](https://github.com/AshleyF/VimSpeak) project. 

Speech icon by Stephen JB Thomas from [The Noun Project](https://thenounproject.com).

### License
MIT