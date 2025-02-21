<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>InfantryTypes</kbd></kbd><br>
<h2 align="center">InfantryTypes</h2>

InfantryTypes represent infantry and creatures that are occupy a subspace of a cell. A cell can contain up to five infantry objects, and they are often eligible for crushing deaths. 

-------

 - [Documentation Guide](#documentation-guide)
 - [New Type Extensions](#new-type-extensions) 
 - [TechnoTypes](#technotypes) 
 - [General Settings](#general-settings) 
 - [Infantry Animations](#infantry-animations)
 - [Custom Voices](#custom-voices) 
 - [AI AutoBase Controls](#ai-autobase-controls) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#infantrytypes"><kbd>Top</kbd></a><br>
-------
### New Type Extensions
<br>

These settings enable you to define new types, expanding modding capabilities.

The game allows for a maximum of 255 types of each kind, inclusive of the ones included in the original game. Be careful not to over-extend it!

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [InfantryTypes]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new InfantryType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[InfantryTypes]
0=COMMANDO
1=E5
```
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [StringTableOffsets] ► Infantry
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Infantry` is set to 400 and `[InfantryTypes] ► 2` is set to E5, then the string table entry for `[E5]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead, which for now is beyond the scope of the project.

If not defined, or set to -1, all additional unit types will default their names to the 'Civilian' text entry.
</details></td></tr></table>


<a href="#infantrytypes"><kbd>Top</kbd></a><br>
-------
### TechnoTypes
<br>

TechnoType settings are also available to InfantryTypes. See [TechnoTypes](./technotypes.md) for more details.


<a href="#infantrytypes"><kbd>Top</kbd></a><br>
-------
### General Settings
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► IsFemale
</samp></td><td width="120"><samp>Boolean</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->IsFemale```

Determines if this civilian infantry should use the female civilian voice.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► IsCrawling
</samp></td><td width="120"><samp>Boolean</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->IsCrawling```

Acts as override switch to `IsFraidyCat`. An infantry that has `IsFraidyCat` set to true and `IsCrawling` set to false will have their speed multiplied by 2 when prone (to emulate the civilian panic sprint). Any other combination will result in the typical reduction of speed by half when prone.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► IsCivilian
</samp></td><td width="120"><samp>Boolean</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->IsCivilian```

Determines if this infantry is a civilian, applying the following changes:

 - Civilian voices (combine with `IsFemale` for a second set of voices)
 - Name description is changed to `Civilian`, unless overriden by the rules / map.
 - Score counting
  - If combined with `Cloakable`, does not uncloak to fire.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► Pip
</samp></td><td width="120"><samp>Byte</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->Pip```

Sets the pip of the transport when carrying this infantry type. This refers to the indexed entry in pips.shp. An unmodified pips.shp can work with the following values:

 > 0 = Empty pip\
 > 1 = Green pip\
 > 5 = Yellow pip (engineer)\
 > 6 = Grey pip (civilian)\
 > 7 = Red pip (commando)
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► Retaliates
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
Human-owned infantry do not automatically retaliate against incoming fire from infantry, unless `PlayerReturnFire` is on.
Tanya was an exception to that, she ignores the setting and fires back. 

Now you can instruct other infantry to be like Tanya.

</details></td></tr></table>



<a href="#infantrytypes"><kbd>Top</kbd></a><br>
-------
### Infantry Animations
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls
</samp></td><td width="120"><samp><a href="./defines.md#infantrytypes">InfantryType</a> or 'CUSTOM'</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->DoControls```

If specified, loads that units' animation control frames for the infantry. Only the original units (up to MECHANIC) are supported.
For full customization, use CUSTOM.

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Ready_Start     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Ready_Count     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Ready_Jump      <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Guard_Start     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Guard_Count     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Guard_Jump      <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Prone_Start     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Prone_Count     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Prone_Jump      <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Walk_Start      <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Walk_Count      <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Walk_Jump       <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Fire_Start      <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Fire_Count      <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Fire_Jump       <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_LieDown_Start   <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_LieDown_Count   <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_LieDown_Jump    <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Crawl_Start     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Crawl_Count     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Crawl_Jump      <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_GetUp_Start     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_GetUp_Count     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_GetUp_Jump      <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_FireProne_Start <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_FireProne_Count <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_FireProne_Jump  <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Idle1_Start     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Idle1_Count     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Idle1_Jump      <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Idle2_Start     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Idle2_Count     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Idle2_Jump      <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death1_Start    <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death1_Count    <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death1_Jump     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death2_Start    <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death2_Count    <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death2_Jump     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death2b_Start   <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death2b_Count   <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death2b_Jump    <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death3_Start    <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death3_Count    <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death3_Jump     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death4_Start    <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death4_Count    <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Death4_Jump     <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Gesture1_Start  <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Gesture1_Count  <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Gesture1_Jump   <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Salute1_Start   <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Salute1_Count   <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Salute1_Jump    <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Gesture2_Start  <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Gesture2_Count  <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Gesture2_Jump   <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Salute2_Start   <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Salute2_Count   <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_Salute2_Jump    <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_DogMaul_Start   <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_DogMaul_Count   <br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls_DogMaul_Jump
</samp></td><td width="120"><samp>Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte<br>
Integer<br>
Byte<br>
Byte
</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->DoControls```

If DoControls is set to CUSTOM, the animation settings for each stage is defined here. The three options for each stage are as follows:

<samp>

|Parameter|Explanation             
:---------|:------------
|`Start`  |The frame index within the shp file to use as the first frame of this stage.
|`Count`  |The number of frames used in this stage, some stages (such as walking) may loop back to Start after <br>the last frame is reached.
|`Jump`   |The number of frames to offset per facing direction, using the 8-cardinal directions. Use 0 if the <br>animation does not depend on the facing.
</samp>

The stages are as follows:

<samp>

|Stage           |Explanation             
:----------------|:------------
|`Ready`         |Default state
|`Guard`         |Guard stance
|`Prone`         |The infantry is prone on the ground. Note that panicking civilians are also considered 'prone'
|`Walk`          |Moving to another location
|`Fire`          |Firing weapon
|`LieDown`       |Laying down transition from Ready to Prone
|`Crawl`         |Moving while prone
|`GetUp`         |Getting up transition from Prone to Ready
|`FireProne`     |Firing weapon, but while prone
|`Idle1`         |Idle animation
|`Idle2`         |Idle animation #2
|`Death1`        |Death by small arms (Warhead ► InfDeath=1)
|`Death2`        |Death by AP explosion (Warhead ► InfDeath=2)
|`Death2b`       |Death by AP explosion (this appears to be unused)
|`Death3`        |Death by HE explosion (Warhead ► InfDeath=3)
|`Death4`        |Death by Fire or Nuke (Warhead ► InfDeath=4 or InfDeath=6)
|`Gesture1`      |Idle animation #3
|`Gesture2`      |Idle animation #4
|`Salute1`       |Idle animation #5
|`Salute2`       |Idle animation #6
|`DogMaul`       |Special animation played after completing a Dog attack
</samp>
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► FireFrame<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► ProneFireFrame
</samp></td><td width="120"><samp>Byte<br>Byte</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->FireFrame```\
```Exposed InfantryTypeClass->ProneFireFrame```

Determines the frame offset from the begining of the firing sequence when the weapon actually fires. This allows for certain frames of animations to pass before the actual weapon is fired. Examples of infantry with this feature is, the Grenadier, the Medic and the Mechanic.
</details></td></tr></table>


<a href="#infantrytypes"><kbd>Top</kbd></a><br>
-------
### Custom Voices
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► ResponseSelect<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► ResponseMove<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► ResponseInvade<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► ResponseAttack<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DeathReport<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DeathReport1<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DeathReport2<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DeathReport3<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DeathReport4<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DeathReport5<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► ActionReport<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► RandomReport<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► StokedReport<br>
<code>{Rules/Map}</code> ► [General]  ► TanyaDeathReport<br>
<code>{Rules/Map}</code> ► [General]  ► DogDeathReport<br>
<code>{Rules/Map}</code> ► [General]  ► DeathReport<br>
<code>{Rules/Map}</code> ► [General]  ► DeathReport1<br>
<code>{Rules/Map}</code> ► [General]  ► DeathReport2<br>
<code>{Rules/Map}</code> ► [General]  ► DeathReport3<br>
<code>{Rules/Map}</code> ► [General]  ► DeathReport4<br>

</samp></td><td width="120"><samp>List<br>
List<br>
List<br>
List<br>
List<br>
List<br>
List<br>
List<br>
List<br>
List<br>
String<br>
String<br>
List<br>
List<br>
List<br>
List<br>
List<br>
List<br>
List<br>
List
</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```New Logic```

If defined, replaces the infantry response when selected or given an order. Up to 16 entries (16 for Select, 16 for Move, 16 for Attack) can be supported. Each entry must be an existing <a href="./defines.md#soundeffects">SoundEffect</a> or defined in `[SoundEffects]`. Entries can be repeated for higher probability.
 
Each entry are as follows:

<samp>

|Stage             |Explanation             
:------------------|:------------
|`ResponseSelect`  |Response when selected
|`ResponseMove`    |Response when ordered to move to a location
|`ResponseInvade`  |Response when ordered to capture or infiltrate a building.<br>If not defined, falls back to `ResponseMove`
|`ResponseAttack`  |Response when ordered to attack a target
|`DeathReport`     |Report when killed <br>(fallback if specific warhead death reports are not specifed)
|`DeathReport1`    |Report when killed by small arms (Warhead ► InfDeath=1)<br>If not defined, falls back to `DeathReport`
|`DeathReport2`    |Report when killed by AP explosion (Warhead ► InfDeath=2)<br>If not defined, falls back to `DeathReport`
|`DeathReport3`    |Report when killed by HE explosion (Warhead ► InfDeath=3)<br>If not defined, falls back to `DeathReport`
|`DeathReport4`    |Report when killed by fire (Warhead ► InfDeath=4)<br>If not defined, falls back to `DeathReport`
|`DeathReport5`    |Report when killed by shock (Warhead ► InfDeath=5)<br>If not defined, falls back to `DeathReport`
|`ActionReport`    |Report when appearing on the map - either trained from a structure, or kicked out of a transport
|`RandomReport`    |Report when a custom animation (DO_IDLE2) is played. This was used by Tanya to periodically say 'Shake a baby'
|`StokedReport`    |Report when a savor animation (DO_GESTURE/DO_GESTURE2) is played. This was used in TD by the Commando to comment after a good kill.
</samp>

Note that `ActionReport` and `RandomReport` accept only one sound, not a list.

Death reports are supported in `[General]` as well, the difference being that `Tanya` and `Dog` have special keys to emulate their special voices in the base game.

Death with Warhead ► InfDeath=X (All infantry except `Tanya` and `Dog`)
<samp>

|Read Priority                         
:----------------------------
|`[&lt;InfantryType&gt;]  ► DeathReportX`     
|`[&lt;InfantryType&gt;]  ► DeathReport`     
|`[General]  ► DeathReportX`     
|`[General]  ► DeathReport`    
|Default values 
</samp>

Death with Warhead ► InfDeath=X (`Tanya`)
<samp>

|Read Priority                         
:----------------------------
|`[&lt;InfantryType&gt;]  ► DeathReportX`     
|`[&lt;InfantryType&gt;]  ► DeathReport`     
|`[General]  ► TanyaDeathReport`     
|Default Tanya scream 
</samp>

Death with Warhead ► InfDeath=X (`Dog`)
<samp>

|Read Priority                         
:----------------------------
|`[&lt;InfantryType&gt;]  ► DeathReportX`     
|`[&lt;InfantryType&gt;]  ► DeathReport`     
|`[General]  ► DogDeathReport`     
|Default Dog whine 
</samp>

</details></td></tr></table>


<a href="#infantrytypes"><kbd>Top</kbd></a><br>
-------
### AI AutoBase Controls
<br>

Auto AI production now take into account new technotypes. Additional controls are provided below.

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► AIBuildWeight
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
Determines the weightage given to this infantry when the AI wishes to build a new unit. The higher the number, the more likely AI will build it.
Defaults to the following values:

 > [E1]: 3 \
 > [E2] and [E4]: 5 \
 > [E3]: 2 \
 > [E6] and [E7]: 1 \
 > All other infantry: 0 (will not be built)

To disable the unit from being built by the AutoBase AI, use `AIBuildWeight`=0.

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► AIBuildLimit
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
Determines the maximum number of infantry instances that the new AutoBase AI can build.
If the value is 0, the AutoBase AI will treat the value as unlimited (no limit).
Defaults to the following values:

 > [E6] and [E7]: 1 \
 > All other infantry: 0 (unlimited)

To disable the unit from being built by the AutoBase AI, use `AIBuildWeight`=0 instead.

Note that the AI might surpass the limit if it has multiple factories.

</details></td></tr></table>


<a href="#infantrytypes"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>InfantryTypes</kbd></kbd><br>

