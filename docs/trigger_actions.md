<a href="../readme.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Trigger Actions</kbd></kbd><br>
<h2 align="center">Trigger Actions</h2>

Trigger Actions are effects that are granted upon a map, when certain conditions are fulfilled. Used extensively in single-player missions.

The new trigger actions are supported in the accompanying [mission editor](https://github.com/nguoiyoujie/Red-Alert-Mission-Editor) for the patched executable. You may also edit them via a text editor.

-------

 - [Modified Behaviours](#modified-behaviours)
 - [New Entries](#new-entries) 


-------
### Modified Behaviours
<br>

The following trigger actions have modified behaviours, but should remain compatible with unmodded game files.

<table><tr><td width="160"><samp>Trigger Action 11</samp></td><td width="852"><samp>Text Trigger</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
2: COLOR (<a href="./defines.md#messagecolortypes">MessageColor</a>)
3: MESSAGE (ID)
</samp></code></pre>

Displays the text <i>MESSAGE</i> string, using <i>COLOR</i> remap. Color defaults to 3 ([![#9dbe75](./img/8x8/3_green.png)](#) GREEN).

Originally, the color is fixed to the green color. Now, other colors (akin to multiplayer text colors) are supported. Using colors beyond 7 is not supported.
</details></td></tr></table>


<a href="#trigger-actions"><kbd>Top</kbd></a><br>
-------
### New Entries
<br>

The following trigger actions have been added to the base game, expanding scripting possibilities.

Trigger Actions 40 to 67 inclusive are inherited from iran's r-series. The rest are new implementations.

<table><tr><td width="160"><samp>Trigger Action 40</samp></td><td width="852"><samp>Add credits</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: HOUSE (<a href="./defines.md#housetypes">HouseType</a>)
2: CREDITS (integer)
</samp></code></pre>

Adds specified amount of <i>CREDITS</i> to the specified <i>HOUSE</i>. Negative amounts subtract instead.
</details></td></tr></table>


<table><tr><td width="160"><samp>Trigger Action 41</samp></td><td width="852"><samp>Add vehicle type to sidebar</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: UNITTYPE (<a href="./defines.md#unittypes">UnitType</a>)
</samp></code></pre>
Adds <i>UNITTYPE</i> to the trigger house's sidebar, bypassing prerequisite checks.

Note that losing the factories, then building a new one, will not re-add the icon to the sidebar. If this level of control is needed, suggest to employ <code>Trigger Action 54 - Set house tech level</code> instead.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 42</samp></td><td width="852"><samp>Add infantry type to sidebar</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: INFANTRYTYPE (<a href="./defines.md#infantrytypes">InfantryType</a>)
</samp></code></pre>
Adds <i>INFANTRYTYPE</i> to the trigger house's sidebar, bypassing prerequisite checks.

Note that losing the factories, then building a new one, will not re-add the icon to the sidebar. If this level of control is needed, suggest to employ <code>Trigger Action 54 - Set house tech level</code> instead.
</details></td></tr></table>


<table><tr><td width="160"><samp>Trigger Action 43</samp></td><td width="852"><samp>Add building type to sidebar</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: BUILDINGTYPE (<a href="./defines.md#buildingtypes">BuildingType</a>)
</samp></code></pre>
Adds <i>BUILDINGTYPE</i> to the trigger house's sidebar, bypassing prerequisite checks.

Note that losing the factories, then building a new one, will not re-add the icon to the sidebar. If this level of control is needed, suggest to employ <code>Trigger Action 54 - Set house tech level</code> instead.
</details></td></tr></table>


<table><tr><td width="160"><samp>Trigger Action 44</samp></td><td width="852"><samp>Add aircraft type to sidebar</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: AIRCRAFTTYPE (<a href="./defines.md#aircrafttypes">AircraftType</a>)
</samp></code></pre>
Adds <i>AIRCRAFTTYPE</i> to the trigger house's sidebar, bypassing prerequisite checks.

Note that losing the factories, then building a new one, will not re-add the icon to the sidebar. If this level of control is needed, suggest to employ <code>Trigger Action 54 - Set house tech level</code> instead.
 </details></td></tr></table>


<table><tr><td width="160"><samp>Trigger Action 45</samp></td><td width="852"><samp>Add vessel type to sidebar</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: VESSELTYPE (<a href="./defines.md#vesseltypes">VesselType</a>)
</samp></code></pre>
Adds <i>VESSELTYPE</i> to the trigger house's sidebar, bypassing prerequisite checks.

Note that losing the factories, then building a new one, will not re-add the icon to the sidebar. If this level of control is needed, suggest to employ <code>Trigger Action 54 - Set house tech level</code> instead.
</details></td></tr></table>


<table><tr><td width="160"><samp>Trigger Action 50</samp></td><td width="852"><samp>Center view at waypoint</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: WAYPOINT (ID, 0 to 99)
</samp></code></pre>
Centers the trigger house's viewport around the specified <i>WAYPOINT</i>.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 51</samp></td><td width="852"><samp>Set house player control</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: HOUSE (<a href="./defines.md#housetypes">HouseType</a>)
2: TOGGLE (0 or 1)
</samp></code></pre>
Sets player control for a <i>HOUSE</i>. Use 1 to enable player control, 0 to disable
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 52</samp></td><td width="852"><samp>Set house primary color</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: HOUSE (<a href="./defines.md#housetypes">HouseType</a>)
2: COLOR (<a href="./defines.md#housecolortypes">HouseColorType</a>)
</samp></code></pre>
Sets primary house <i>COLOR</i> for a <i>HOUSE</i>.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 53</samp></td><td width="852"><samp>Set house secondary color</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: HOUSE (<a href="./defines.md#housetypes">HouseType</a>)
2: COLOR (<a href="./defines.md#housecolortypes">HouseColorType</a>)
</samp></code></pre>
Sets secondary house <i>COLOR</i> for a <i>HOUSE</i>. The secondary color is used by the house's buildings, MCV and harvester. Dual colors is generally used in C&C for Nod.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 54</samp></td><td width="852"><samp>Set house tech level</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: HOUSE (<a href="./defines.md#housetypes">HouseType</a>)
2: TECHLEVEL (Integer)
</samp></code></pre>
Sets the <i>TECHLEVEL</i> for a <i>HOUSE</i>.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 55</samp></td><td width="852"><samp>Set house IQ level</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: HOUSE (<a href="./defines.md#housetypes">HouseType</a>)
2: IQ (Integer)
</samp></code></pre>
Sets the <i>IQ</i> level for a <i>HOUSE</i>.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 56</samp></td><td width="852"><samp>Set house ally</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: HOUSE (<a href="./defines.md#housetypes">HouseType</a>)
2: TARGET_HOUSE (<a href="./defines.md#housetypes">HouseType</a>)
</samp></code></pre>
Forces one <i>HOUSE</i> to consider another <i>TARGET_HOUSE</i> as an ally. This does not change <i>TARGET_HOUSE</i>'s perception of <i>HOUSE</i>, so you may want to set two actions to ensure mutual alliance.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 57</samp></td><td width="852"><samp>Set house enemy</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: HOUSE (<a href="./defines.md#housetypes">HouseType</a>)
2: TARGET_HOUSE (<a href="./defines.md#housetypes">HouseType</a>)
</samp></code></pre>
Forces one <i>HOUSE</i> to unally another <i>TARGET_HOUSE</i> as an enemy. This does not change <i>TARGET_HOUSE</i>'s perception of <i>HOUSE</i>, so you may want to set two actions to ensure mutual enemity.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 58</samp></td><td width="852"><samp>Create chrono vortex at waypoint</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: WAYPOINT (ID, 0 to 99)
</samp></code></pre>
Creates a Chrono Vortex at the specified <i>WAYPOINT</i>.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 59</samp></td><td width="852"><samp>Nuke strike at waypoint</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: WAYPOINT (ID, 0 to 99)
</samp></code></pre>
Drops a nuke at the specified <i>WAYPOINT</i>.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 60</samp></td><td width="852"><samp>Capture attached objects</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: HOUSE (<a href="./defines.md#housetypes">HouseType</a>)
</samp></code></pre>
Causes the <i>HOUSE</i> to instantaneously capture structures, units and infantry that this trigger is attached to. Capturing structures only work for `Capturable`=true structures, akin to an engineer capturing them.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 61</samp></td><td width="852"><samp>Iron Curtain attached objects</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: DURATION (frames)
</samp></code></pre>
Applies the Iron Curtain effect on structures for a specified <i>DURATION</i>, units and infantry that this trigger is attached to. Use -1 for DURATION to use the default Iron Curtain setting, otherwise the DURATION represents the number of frames the effect lasts.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 62</samp></td><td width="852"><samp>Create building at waypoint</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: BUILDINGTYPE (<a href="./defines.md#buildingtypes">BuildingType</a>)
2: WAYPOINT (ID, 0 to 99)
3: HOUSE (<a href="./defines.md#housetypes">HouseType</a>)
</samp></code></pre>
Creates a <i>BUILDINGTYPE</i> for a <i>HOUSE</i> at a <i>WAYPOINT</i>. This mimics the building placement process, so if the terrain is blocked, the building will not be created
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 63</samp></td><td width="852"><samp>Set mission of attached objects</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: MISSIONTYPE (ID)
</samp></code></pre>
Sets the mission of attached objects to <i>MISSIONTYPE</i>. Only certain missions have a real effect.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 64</samp></td><td width="852"><samp>Toggle repair for attached objects</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
No parameters
</samp></code></pre>
Toggles the repair on attached buildings. Only has an effect on buildings.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 65</samp></td><td width="852"><samp>Chronoshift attached objects</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: WAYPOINT (ID, 0 to 99)
</samp></code></pre>
Chronoshifts the attached objects to a <i>WAYPOINT</i>.
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 65</samp></td><td width="852"><samp>Chronoshift trigger object</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: WAYPOINT (ID, 0 to 99)
</samp></code></pre>
Chronoshifts the activating object to a <i>WAYPOINT</i>. The activating object is the object which fired the corresponding event (such as an <code>Entered by...</code> event).
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 67</samp></td><td width="852"><samp>Iron Curtain trigger object</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: DURATION (frames)
</samp></code></pre>
Iron Curtains the activating object for a specified <i>DURATION</i>. The DURATION represents the number of frames the effect lasts. The activating object is the object which fired the corresponding event (such as an <code>Entered by...</code> event).
</details></td></tr></table>

<table><tr><td width="160"><samp>Trigger Action 68</samp></td><td width="852"><samp>Set map dimensions</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>
<pre><code><samp>Parameters
1: CELL (Integer, 0 to 16383)
2: WIDTH (Integer)
3: HEIGHT (Integer)
</samp></code></pre>
Sets new dimensions for the playable bounds of the map. <i>CELL</i> deterimines the top-left corner, and <i>WIDTH</i> / <i>HEIGHT</i> determines the dimensions.

The CELL number is essentially `128 * Y + X`. Some map editors may be able to provide the cell number of a cell location.

The map does not yet rescroll after setting the new dimensions. It is possible for the map to reveal features outside the playable bounds due to changing dimensions. This behavior may change in the future.
</details></td></tr></table>


<a href="#trigger-actions"><kbd>Top</kbd></a><br>
------
<a href="../readme.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Trigger Actions</kbd></kbd><br>
