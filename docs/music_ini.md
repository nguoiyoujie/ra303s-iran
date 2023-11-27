[Return to Features](./features.md)

## Music INI Options

Additional music can be loaded into the game via music.ini.

-------

 - [New Music Entries](#new-music-entries)


-------
### New Music Entries 
[Top](#music-ini-options)

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{music.ini}</code> ► [Fullnames]
</td><td width="50">List</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

The list of names for the music, in display order.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{music.ini}</code> ► [Filenames]
</td><td width="50">List</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

The list of file names that each music entry references, in order.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{music.ini}</code> ► [Tracklength]
</td><td width="50">List</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

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


-------
[Return to Features](./features.md)
