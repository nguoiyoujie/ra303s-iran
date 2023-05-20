## Trigger Actions

Trigger Actions are effects that are granted upon a map, when certain conditions are fulfilled. Used extensively in single-player missions.

The new trigger actions are supported in the accompanying [mission editor](https://github.com/nguoiyoujie/Red-Alert-Mission-Editor) for the patched executable. You may also edit them via a text editor.

-------

 - [Modified Behaviours](#modified-behaviours)
 - [New Entries](#new-entries) 

-------

### Modified Behaviours

The following trigger actions have modified behaviours, but should remain compatible with unmodded game files.

<details>
  <summary><b><code>Trigger Action 11 - Text Trigger</code></b></summary>

```
Parameter 2: COLOR (ID)
Parameter 3: MESSAGE (ID)
```
Displays the text MESSAGE string, using COLOR pattette (0 = GOLD, 1 = LTBLUE, 2 = RED, 3 = GREEN, 4 = ORANGE, 5 = BLUE, 6 = GREY, 7 = BROWN), defaults to GREEN.

Originally, the color is fixed to the green color. Now, other colors (akin to multiplayer text colors) are supported. Using colors beyond 7 is not supported.

</details>

-------

### New Entries

The following trigger actions have been added to the base game, expanding scripting possibilities.

Trigger Actions 40 to 67 inclusive are inherited from iran's r-series. The rest are new implementations.

<details>
  <summary><b><code>Trigger Action 40 - Add credits</code></b></summary>

```
Parameter 1: HOUSE (ID)
Parameter 2: CREDITS (INTEGER)
```
Adds specified amount of CREDITS to the specified HOUSE. Negative amounts subtract instead.

</details>

<details>
  <summary><b><code>Trigger Action 41 - Add vehicle type to sidebar</code></b></summary>

```
Parameter 1: UNITTYPE (ID)
```
Adds UNITTYPE to the trigger house's sidebar, bypassing prerequisite checks.

Note that losing the factories, then building a new one, will not re-add the icon to the sidebar. 

</details>

<details>
  <summary><b><code>Trigger Action 42 - Add infantry type to sidebar</code></b></summary>

```
Parameter 1: INFANTRYTYPE (ID)
```
Adds INFANTRYTYPE to the trigger house's sidebar, bypassing prerequisite checks.

Note that losing the factories, then building a new one, will not re-add the icon to the sidebar. 

</details>

<details>
  <summary><b><code>Trigger Action 43 - Add building type to sidebar</code></b></summary>

```
Parameter 1: BUILDINGTYPE (ID)
```
Adds BUILDINGTYPE to the trigger house's sidebar, bypassing prerequisite checks.

Note that losing the factories, then building a new one, will not re-add the icon to the sidebar. 

</details>

<details>
  <summary><b><code>Trigger Action 44 - Add aircraft type to sidebar</code></b></summary>

```
Parameter 1: AIRCRAFTTYPE (ID)
```
Adds AIRCRAFTTYPE to the trigger house's sidebar, bypassing prerequisite checks.

Note that losing the factories, then building a new one, will not re-add the icon to the sidebar.
 
</details>

<details>
  <summary><b><code>Trigger Action 45 - Add vessel type to sidebar</code></b></summary>

```
Parameter 1: VESSELTYPE (ID)
```
Adds VESSELTYPE to the trigger house's sidebar, bypassing prerequisite checks.

Note that losing the factories, then building a new one, will not re-add the icon to the sidebar. 

</details>

<details>
  <summary><b><code>Trigger Action 50 - Center view at</code></b></summary>

```
Parameter 1: WAYPOINT (ID)
```
Centers the trigger house's viewport around the specified waypoint

</details>

<details>
  <summary><b><code>Trigger Action 51 - Set house player control</code></b></summary>

```
Parameter 1: HOUSE (ID)
Parameter 2: TOGGLE (0 or 1)
```
Sets player control for a HOUSE. Use 1 to enable player control, 0 to disable

</details>

<details>
  <summary><b><code>Trigger Action 52 - Set house primary color</code></b></summary>

```
Parameter 1: HOUSE (ID)
Parameter 2: COLOR (ID)
```
Sets primary house COLOR for a HOUSE.

</details>

<details>
  <summary><b><code>Trigger Action 53 - Set house secondary color</code></b></summary>

```
Parameter 1: HOUSE (ID)
Parameter 2: COLOR (ID)
```
Sets secondary house COLOR for a HOUSE. The secondary color is used by the house's buildings, MCV and harvester. This is generally used in C&C for Nod.

</details>

<details>
  <summary><b><code>Trigger Action 54 - Set house tech level</code></b></summary>

```
Parameter 1: HOUSE (ID)
Parameter 2: TECHLEVEL (INTEGER)
```
Sets the TECHLEVEL for a HOUSE

</details>

<details>
  <summary><b><code>Trigger Action 55 - Set house IQ level</code></b></summary>

```
Parameter 1: HOUSE (ID)
Parameter 2: IQ (INTEGER)
```
Sets the IQ level for a HOUSE

</details>

<details>
  <summary><b><code>Trigger Action 56 - Set house ally</code></b></summary>

```
Parameter 1: HOUSE (ID)
Parameter 2: TARGET_HOUSE (ID)
```
Forces one HOUSE to ally another TARGET_HOUSE. This works one way, so you may want to set two actions to ensure mutual alliance.

</details>

<details>
  <summary><b><code>Trigger Action 57 - Set house enemy</code></b></summary>

```
Parameter 1: HOUSE (ID)
Parameter 2: TARGET_HOUSE (ID)
```
Forces one HOUSE to unally another TARGET_HOUSE. This works one way, so you may want to set two actions to ensure mutual enemity.

</details>

<details>
  <summary><b><code>Trigger Action 58 - Create chrono vortex at</code></b></summary>

```
Parameter 1: WAYPOINT (ID)
```
Creates a Chrono Vortex at the specified WAYPOINT.

</details>

<details>
  <summary><b><code>Trigger Action 59 - Nuke strike at</code></b></summary>

```
Parameter 1: WAYPOINT (ID)
```
Drops a nuke at the specified WAYPOINT.

</details>

<details>
  <summary><b><code>Trigger Action 60 - Capture attached objects</code></b></summary>

```
Parameter 1: HOUSE (ID)
```
Sets the HOUSE for structures, units and infantry that this trigger is attached to. Capturing structures only work for `Capturable`=true structures, akin to an engineer capturing them.

</details>

<details>
  <summary><b><code>Trigger Action 61 - Iron Curtain attached objects</code></b></summary>

```
Parameter 1: DURATION (frames)
```
Applies the Iron Curtain effect on structures for a specified DURATION, units and infantry that this trigger is attached to. Use -1 for DURATION to use the default Iron Curtain setting, otherwise the DURATION represents the number of frames the effect lasts.

</details>

<details>
  <summary><b><code>Trigger Action 62 - Create structure at</code></b></summary>

```
Parameter 1: BUILDINGTYPE (ID)
Parameter 2: WAYPOINT (ID)
Parameter 3: HOUSE (ID)
```
Creates a STRUCTURE for a HOUSE at a WAYPOINT. This mimics the building placement process, so if the terrain is blocked, the structure will not be created

</details>

<details>
  <summary><b><code>Trigger Action 63 - Set mission of attached objects</code></b></summary>

```
Parameter 1: MISSIONTYPE (ID)
```
Sets the mission of attached objects. Only certain missions have a real effect.

</details>

<details>
  <summary><b><code>Trigger Action 64 - Repair attached objects</code></b></summary>

```
No parameters
```
Toggles the repair on buildings. Only has an effect on buildings.

</details>

<details>
  <summary><b><code>Trigger Action 65 - Chronoshift attached objects</code></b></summary>

```
Parameter 1: WAYPOINT (ID)
```
Chronoshifts the attached objects to a WAYPOINT.

</details>

<details>
  <summary><b><code>Trigger Action 66 - Chronoshift trigger object</code></b></summary>

```
Parameter 1: WAYPOINT (ID)
```
Chronoshifts the activating object to a WAYPOINT.

</details>

<details>
  <summary><b><code>Trigger Action 67 - Iron Curtain trigger object</code></b></summary>

```
Parameter 1: DURATION (frames)
```
Iron Curtains the activating object for a specified DURATION. The DURATION represents the number of frames the effect lasts.

</details>

<details>
  <summary><b><code>Trigger Action 68 - Set map dimensions</code></b></summary>

```
Parameter 1: CELL (INTEGER)
Parameter 2: WIDTH (INTEGER)
Parameter 3: HEIGHT (INTEGER)
```
Sets new dimensions for the playable bounds of the map. CELL deterimines the top-left corner, and WIDTH / HEIGHT determines the dimensions.

The CELL number is essentially `128 * Y + X`. Some map editors may be able to provide the cell number of a cell location.

The map does not yet rescroll after setting the new dimensions. It is possible for the map to reveal features outside the playable bounds due to changing dimensions. This behavior may change in the future.

</details>