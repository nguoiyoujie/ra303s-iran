;
; Copyright (c) 2012 Toni Spets <toni.spets@iki.fi>
;
; Permission to use, copy, modify, and distribute this software for any
; purpose with or without fee is hereby granted, provided that the above
; copyright notice and this permission notice appear in all copies.
;
; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
;

;[org 0x006ED220]
;[org 0x00711000]
;[org 0x00703000] ; space achieved by removing .reloc section (and adding icons in .rsrc)

;_str_version: db"3.03p4 B6 ",0
;_str_version: db"3.03p-iB1v1",0
;_str_version: db"3.03s-v01-20241225",0

%include "config.inc"

; /include
%include "const.inc"
%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/datatypes.inc"
%include "libc.inc"
%include "types/INIClass.inc"
%include "types/CCINIClass.inc"
%include "types/common.inc"

%include "types/ini.inc"

; Version
%include "src/version.asm"

; definitions
%include "defines/gametypes.inc"
%include "defines/rttitypes.inc"
%include "defines/missiontypes.inc"
%include "defines/technotypes.inc"
%include "defines/housetypes.inc"
%include "defines/playercolortypes.inc"
%include "defines/armortypes.inc"
%include "defines/prereqtypes.inc"
%include "defines/specialtypes.inc"
%include "defines/tracktypes.inc"
%include "defines/aibuildtypes.inc"

; macros 
%include "src/macros/common.asm"


; typeclass_macros ; added by lovalmidas
%include "types/AbstractTypeClass.inc"
%include "types/ObjectTypeClass.inc"
%include "types/TechnoTypeClass.inc"
%include "types/AircraftTypeClass.inc"
%include "types/BuildingTypeClass.inc"
%include "types/HouseClass.inc"
%include "types/HouseTypeClass.inc"
%include "types/InfantryTypeClass.inc"
%include "types/UnitTypeClass.inc"
%include "types/VesselTypeClass.inc"
%include "types/WarheadTypeClass.inc"
%include "types/WeaponTypeClass.inc"

%include "types/TechnoClass.inc"


;map snapshot code
%include "src/map_snapshot.asm"

;spawner code
%include "src/spawn.asm"
%include "src/spawner_files.asm"
%include "src/spawner_tunnel.asm"

%include "src/features/type_extensions/extended_triggeraction.asm"

;rules unhardcode
%include "src/features/type_extensions/early_rules_ini_load.asm"

;feature: AI enhancements to use extended classes
%include "src/features/ai_obeyprereq.asm" ; added by lovalmidas
%include "src/features/ai_vessels.asm" ;probably desyncs online with 3.03
%include "src/features/ai_units.asm" 
%include "src/features/ai_infantry.asm" 
%include "src/features/ai_building.asm" 
%include "src/features/ai_aircrafts.asm" 

;feature: new prerequisite system
;%include "src/features/new_prerequisite_system.asm" 
;%include "src/features/superweapons.asm" 

; features
;%include "src/ore_lasts_longer.asm" ; ONLY ENABLE FOR TESTING
%include "src/features/atom_damage_custom.asm"
%include "src/ingame_display_messages_from_yourself.asm"
%include "src/features/coop.asm"
%include "src/features/no_digest.asm"
%include "src/features/spectator.asm"
%include "src/features/radar_spectator.asm"
%include "src/features/forced_alliances.asm"
%include "src/features/teamtype_buildings.asm"

%include "src/features/no_tesla_zap_effect_delay.asm"
%include "src/features/short_game.asm"
%include "src/features/no_screenshake.asm"
%include "src/shorter_multiplayer_reconnect_timer.asm"
;%include "src/harvester_harvest_closest_ore.asm" ; same thing what pressing S on harvesters does, desyncs online and keeps mining new ore spawned by ore mines
%include "src/features/multiplayer_predetermined_alliances.asm"
%include "src/features/build_off_ally.asm"
%include "src/selectable_Spawn_locations.asm"
;%include "src/unused/special_colourscheme.asm"
%include "src/features/arguments.asm"
%include "src/strip_cameos_glitch_bug.asm"
%include "src/internet_cncnet.asm"
%include "src/singleplayer_custom_colours_countries.asm"
%include "src/sidebar_special_houses.asm"
%include "src/video_stretching_helpers.asm"
%include "src/spawner_house_colours_countries_handicaps.asm"
%include "src/spawner_stats.asm"
;%include "src/debug_printing.asm" ; Seems to cause crashes
%include "src/features/hotkeys.asm"
%include "src/features/extra_theaters.asm"
%include "src/features/extra_sounds.asm"
%include "src/evac_in_mp.asm"
;%include "src/custom_paradrop_superweapon.asm"
%include "src/expansions.asm"
%include "src/custom_missions.asm"
%include "src/features/ally_shroud_reveal.asm"
%include "src/ingame_chat_improvments.asm"
%include "src/extra_multiplayer_countries.asm"
%include "src/features/aftermath_fast_buildspeed_option.asm"
%include "src/optional_scorescreen.asm"
%include "src/features/radar_default_zoom_out.asm"
;%include "src/features/load_ai_ini.asm" ; Changing AI settings desyncs online...
%include "src/ai_fixes.asm"

%include "src/features/ai_mutual_alliances.asm"
%include "src/features/ai_difficulty_customizations.asm"


%include "src/parabombs_multiplayer.asm"
%include "src/features/mousewheel_scrolling.asm"
%include "src/features/skirmish_savegames.asm"
%include "src/sidebar_cameo_icons_remap_colours.asm"
%include "src/features/extended_house_colors.asm"
;%include "unused/more_colour_remaps.asm" ; not done yet and needs a fix for a crash
%include "src/features/aircraft_maxpips.asm"
; code extensions, added by lovalmidas
%include "src/features/aircraft_isdropping_act_like_parabombs.asm" 
%include "src/features/battlecontrolterminated_delayblackscreen.asm"  
%include "src/features/building_jammable_override.asm" 
%include "src/features/building_mission_repair.asm" 
%include "src/features/building_mission_unload.asm" 
%include "src/features/building_true_owners.asm" 
%include "src/features/unit_turret_draw.asm" 
%include "src/features/tesla_charging_unhardcode.asm" 
%include "src/features/new_tracktypes.asm"
%include "src/features/aircraft_transports_face_north.asm"

%include "src/features/building_autobase_base_housecheck.asm" 
%include "src/features/remake_shroud_mapedges.asm" 
%include "src/features/resizable_map.asm" 
%include "src/features/unit_deploys_into_unhardcode.asm" 
%include "src/features/unit_unload_passengers_unhardcode.asm" 
%include "src/features/entering_transports_triggers_event.asm" 
%include "src/features/building_undeploys_into_unhardcode.asm" 
%include "src/footclass_path.asm" 
%include "src/features/vessel_carrier_autoacquire.asm" 
%include "src/features/vessel_cruiser_missilesub_cantarget_ships.asm"
%include "src/features/vessel_turret_draw.asm" 
%include "src/features/unit_reload.asm" 
%include "src/features/no_cameo_icons.asm" 
%include "src/features/singleplayer_use_multbias.asm"

%include "src/features/combat_spreadfactorzero.asm" 
%include "src/features/combat_negativedamage.asm" 
%include "src/features/building_barrel_explosions.asm"
%include "src/features/aircraft_response.asm"
%include "src/features/infantry_response.asm"
%include "src/features/unit_vessel_response.asm"
%include "src/features/waterbound_units.asm" 
%include "src/features/units_apc_dehardcode.asm" 
%include "src/features/units_v2rl_dehardcode.asm" 
%include "src/features/ai_load_infantry_to_any_transport.asm" 
%include "src/features/ai_repair_singleplayer.asm"
;%include "src/features/house_new_quantity_tracking_offsets.asm"
%include "src/features/building_powerplant_pips.asm"
%include "src/features/building_kennel_unhardcode.asm"
%include "src/features/building_repairpad_unhardcode.asm"
%include "src/features/building_silo_unhardcode.asm"
%include "src/features/building_refinery_helipad_airfield_unhardcode.asm"
%include "src/features/building_exit_unhardcode.asm"
%include "src/features/unit_harvester_unhardcode.asm"
%include "src/features/aircraft_isfixedwing.asm"
%include "src/features/power_autoscale.asm"
%include "src/features/houses_heliunit.asm"
%include "src/features/houses_mcvunit.asm"
%include "src/features/building_freeunit.asm"
%include "src/features/building_construction_yard_unhardcode.asm"

; experimental
%include "src/experimental/bullet_scatter.asm"
%include "src/experimental/experiment_jam_remap.asm" 
;%include "src/experimental/experiment_cnc_refinery.asm" 

%ifdef USE_NOCD
%include "src/features/nocd.asm"
%endif

%ifdef USE_EXCEPTIONS
%include "src/exception.asm"
%endif

%ifdef USE_BUGFIXES
; fixes should not depend on one another
; sort alphabetically
%include "src/fixes/ai_build_radar_dome.asm"
%include "src/fixes/ai_topleft_bug.asm"
%include "src/fixes/always_load_building_icons.asm"
%include "src/fixes/animate_score_objects_crash_fix.asm"
%include "src/fixes/building_crew_impassable_terrain_fix.asm"
%include "src/fixes/building_power_clear_drain.asm" 
%include "src/fixes/building_limbo_storage_fix.asm"
%include "src/fixes/cancel_network_join_menu_lag_fix.asm"
%include "src/fixes/cell_occupier_multi_buildings.asm"
%include "src/fixes/cloaked_units_shadow_fix.asm"
%include "src/fixes/cpu_affinity_freeze_crash.asm"
%include "src/fixes/credits_screen_cncddraw_fix.asm"
%include "src/fixes/engi_q_freeze_fix.asm"
%include "src/fixes/error_dialog_title_fix.asm"
%include "src/fixes/explosion_no_anim_crash_fix.asm"
%include "src/fixes/fence_bug.asm"
%include "src/fixes/formation_glitch_fix.asm"
%include "src/fixes/gnrl_ukraine_voice.asm"
%include "src/fixes/infantry_infinite_deathloop_fix.asm"
%include "src/fixes/infantry_range_check.asm"
%include "src/fixes/invalid_team_crash_fix.asm"
%include "src/fixes/invalid_techno_crash_fix.asm"
%include "src/fixes/invisible_explosions_fix.asm" ; Causes desync with 3.03
%include "src/fixes/localise_draw_strings.asm"
%include "src/fixes/map_sight_no_incremental.asm" 
%include "src/fixes/max_units_bug.asm"
%include "src/fixes/magic_build_fix.asm"
%include "src/fixes/mcv_undeploy_fix.asm"
%include "src/fixes/modem_menu_remove.asm"
%include "src/fixes/multiplayer_settings_saving_fix.asm"
%include "src/fixes/naval_repair_fix.asm"
;%include "src/fixes/south_advantage.asm" ; test fix
%include "src/fixes/playback_fix.asm"
%include "src/fixes/radar_dome_crash_fix.asm"
%include "src/fixes/refresh_cells_crash_fix.asm"
%include "src/fixes/remove_difficulty_gamespeed_modifier.asm"
%include "src/fixes/ore_truck_ore_patch_minimap_cursor_bug_fix.asm"
%include "src/fixes/savegame_diskspace_fix.asm"
%include "src/fixes/score_screen_print_colour_fix.asm"
%include "src/fixes/skip_deleting_conquer_eng.asm"
%include "src/fixes/submarine_decloak_skip_campaign.asm"
%include "src/fixes/tech_center_bug_fix.asm"
%include "src/fixes/toinherit_fix.asm"
%include "src/fixes/what_weapon_should_i_use_crash_fix.asm"
%include "src/fixes/wide_area_damage.asm"

%include "src/image_keyword_fix.asm"
%include "src/allies_NCO_helipad_airfield_bug.asm"
%include "src/tags_bug.asm"
%endif


%ifdef USE_NEW_MULTIPLAYER_DEFAULTS
%include "src/multiplayer_defaults.asm"
%endif

%ifdef USE_LOAD_MORE_MIX_FILES
%endif

%ifdef FOCUS_LOSS_KEEP_PLAYING_SOUND
%include "src/focus_loss_keep_playing_sound.asm"
%endif

%ifdef LOAD_FIX_OOS_INI
%include "src/fixes/rules_oos.asm"
%endif
