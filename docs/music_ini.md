[Return to Features](./features.md)

## Music INI Options

Additional music can be loaded into the game via music.ini.

-------

 - [New Music Entries](#new-music-entries)

-------

### New Music Entries 

<details>
  <summary>
    <b><code>{music.ini} ► [Fullnames]</code></b>
  </summary>

```Inherited from iran's s-series```

The list of names for the music, in display order.

</details>

<details>
  <summary>
    <b><code>{music.ini} ► [Filenames]</code></b>
  </summary>

```Inherited from iran's s-series```

The list of file names that each music entry references, in order.

</details>

<details>
  <summary>
    <b><code>{music.ini} ► [Tracklength]</code></b>
  </summary>

```Inherited from iran's s-series```

The list of durations, in seconds, for each music entry, in display order.

</details>


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