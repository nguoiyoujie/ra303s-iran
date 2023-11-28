<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Music INI Options</kbd></kbd><br>
<h2 align="center">Music INI Options</h2>

Additional music can be loaded into the game via music.ini.

-------

 - [New Music Entries](#new-music-entries)


-------
### New Music Entries 
<br>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{music.ini}</code> ► [Fullnames]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

The list of names for the music, in display order.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{music.ini}</code> ► [Filenames]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

The list of file names that each music entry references, in order.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{music.ini}</code> ► [Tracklength]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

The list of durations, in seconds, for each music entry, in display order.
</details></td></tr></table>


An example of the complete listing of one additional music is as follows:

```ini
; music.ini file for extra music addon
[Fullnames]
1=The Second Hand (Retaliation)
[Filenames]
1=2nd_hand.AUD
[Tracklength]
1=283 ; in seconds
```

Make sure there's an empty (blank) line at the end of the file or the last entry may not be read.


<a href="#music-ini-options"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Music INI Options</kbd></kbd><br>
