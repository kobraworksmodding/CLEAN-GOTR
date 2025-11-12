REM 4/1/11
REM Gentlemen of the Row Optional Mod Batch Installer by IdolNinja
REM http://idolninja.com
REM EDITED BY UZIS FOR COMPATIBILITY WITH JUICED PATCH AND DLC.

@echo off
title CGOTR Suite
REM Double check and make sure the dummy actually extracted the entire archive

IF NOT EXIST "optional_mod_stuff" (
echo.
echo.
echo WARNING - Optional mods folder doesn't exist. 
echo    Did you forget to extract the whole archive?
echo.
pause
GOTO OOPS
)

IF NOT EXIST "MY_CUSTOM_PATCH" (
echo.
echo.
echo WARNING - MY_CUSTOM_PATCH folder doesn't exist. 
echo    Did you forget to extract the whole archive?
echo.
pause
GOTO OOPS
)


REM INTRO SPLASH SCREEN
cls
color 0a
echo.
echo     Welcome to the Gentlemen of the Row Saints Row 2 Custom Patch Builder!
echo.
echo.
echo    This simple menu system enables you to select options and build a custom
echo    patch to give you even more freedom to play the game the way you want to.
echo    Be warned though! Most of the optional mods were left out of the base
echo    build of GotR for a reason. They are either buggy, or even break parts
echo    of the game!
echo.
echo.
echo    If you are new to SR2, I strongly encourage you to simply build the patch
echo    without any optional mods (other than controls and/or onscreen prompts.)
echo    Doing so will create the base build of GotR which includes 99 percent of
echo    all the mods (everything stable) and the best possible experience.
echo.
echo.
echo    Have fun and enjoy the mod! -IdolNinja
echo.
echo    CGOTR BY UZIS FOR COMPATIBILITY WITH SR2 PC DLC PROJECT.
echo.
echo.
echo.
pause


REM Delete the anything left over from the previous build
del optional_mod_stuff\tmp_workspace\*.* /Q
del MY_CUSTOM_PATCH\*.* /Q



:READINI

REM Make sure the gotr.ini file exists which contains settings from last build. If not, just jump to reset_vars which sets everything to none.

IF NOT EXIST "optional_mod_stuff\gotr.ini" (
GOTO RESET_VARS
)



REM Read gotr.ini and set all the variable values. This ini is written at the end of the batch after building the patch, so by readin g it in you're saving all user settings from last time. Pretty neato.


for /f "tokens=1,2 delims==" %%a in (optional_mod_stuff\gotr.ini) do (
  if %%a==CONTROL_MENU_PLUS set CONTROL_MENU_PLUS=%%b
  if %%a==SLIDER_MENU_PLUS set SLIDER_MENU_PLUS=%%b
  if %%a==ANIMATION_MENU_PLUS set ANIMATION_MENU_PLUS=%%b
  if %%a==GRAPHICS_MENU_PLUS set GRAPHICS_MENU_PLUS=%%b
  if %%a==CLOTHING_MENU_PLUS set CLOTHING_MENU_PLUS=%%b
  if %%a==GANG_MENU_PLUS set GANG_MENU_PLUS=%%b
  if %%a==WEAPON_MENU_PLUS set WEAPON_MENU_PLUS=%%b
  if %%a==VEHICLE_MENU_PLUS set VEHICLE_MENU_PLUS=%%b
  if %%a==AUDIO_MENU_PLUS set AUDIO_MENU_PLUS=%%b
  if %%a==CAMERA_MENU_PLUS set CAMERA_MENU_PLUS=%%b
  if %%a==MISC_MENU_PLUS set MISC_MENU_PLUS=%%b
  if %%a==OPEN_MENU_PLUS set OPEN_MENU_PLUS=%%b
  if %%a==ZU_MENU_PLUS set ZU_MENU_PLUS=%%b
  if %%a==STICKY_CAM_MOD set STICKY_CAM_MOD=%%b
  if %%a==HANDLING_MOD set HANDLING_MOD=%%b
  if %%a==HUDLESS_MOD set HUDLESS_MOD=%%b
  if %%a==SUPER_SLIDERS_MOD set SUPER_SLIDERS_MOD=%%b
  if %%a==HUGE_MUSCLE_MOD set HUGE_MUSCLE_MOD=%%b
  if %%a==HEIGHT3_MOD set HEIGHT3_MOD=%%b
  if %%a==HEIGHT4_MOD set HEIGHT4_MOD=%%b
  if %%a==HEIGHT5_MOD set HEIGHT5_MOD=%%b
  if %%a==HEIGHT7_MOD set HEIGHT7_MOD=%%b
  if %%a==HEIGHT8_MOD set HEIGHT8_MOD=%%b
  if %%a==SKATEBOARDING_MOD set SKATEBOARDING_MOD=%%b
  if %%a==ROLLERBLADING_MOD set ROLLERBLADING_MOD=%%b
  if %%a==POLICE_ANIM_MOD set POLICE_ANIM_MOD=%%b
  if %%a==FEMALE_WALK_ANIM_MOD set FEMALE_WALK_ANIM_MOD=%%b
  if %%a==GIRLY_WALK_ANIM_MOD set GIRLY_WALK_ANIM_MOD=%%b
  if %%a==GOTR_SPRAY_MOD set GOTR_SPRAY_MOD=%%b
  if %%a==FIGHTBEAUTIES_SPRAY_MOD set FIGHTBEAUTIES_SPRAY_MOD=%%b
  if %%a==RONINLOGO_MOD set RONINLOGO_MOD=%%b
  if %%a==CRAZY_DOLLAR_MOD set CRAZY_DOLLAR_MOD=%%b
  if %%a==WINGEDFLEUR_TAT_MOD set WINGEDFLEUR_TAT_MOD=%%b
  if %%a==GENKI_TAT_MOD set GENKI_TAT_MOD=%%b
  if %%a==SAM_TAT_MOD set SAM_TAT_MOD=%%b
  if %%a==WARDROBE_COLOR_MOD set WARDROBE_COLOR_MOD=%%b
  if %%a==GANG_MEDICAL_MOD set GANG_MEDICAL_MOD=%%b
  if %%a==GANG_MIME_MOD set GANG_MIME_MOD=%%b
  if %%a==GANG_RONIN_MOD set GANG_RONIN_MOD=%%b
  if %%a==GANG_BEACH_MOD set GANG_BEACH_MOD=%%b
  if %%a==GANG_EXEC_MOD set GANG_EXEC_MOD=%%b
  if %%a==GANG_LAW_MOD set GANG_LAW_MOD=%%b
  if %%a==GANG_BARBERSHOP_MOD set GANG_BARBERSHOP_MOD=%%b
  if %%a==GANG_NUCLEAR_MOD set GANG_NUCLEAR_MOD=%%b
  if %%a==GANG_COWBOY_MOD set GANG_COWBOY_MOD=%%b
  if %%a==GANG_STRIPPER_MOD set GANG_STRIPPER_MOD=%%b
  if %%a==GANG_CHEERLEADER_MOD set GANG_CHEERLEADER_MOD=%%b
  if %%a==GANG_ELDERLY_MOD set GANG_ELDERLY_MOD=%%b
  if %%a==GANG_GOTH_MOD set GANG_GOTH_MOD=%%b
  if %%a==GANG_SAMEDI_MOD set GANG_SAMEDI_MOD=%%b
  if %%a==GANG_HIPPIE_MOD set GANG_HIPPIE_MOD=%%b
  if %%a==GANG_BUM_MOD set GANG_BUM_MOD=%%b
  if %%a==GANG_CONSTRUCTION_MOD set GANG_CONSTRUCTION_MOD=%%b
  if %%a==GANG_SCIENTIST_MOD set GANG_SCIENTIST_MOD=%%b
  if %%a==GANG_PRISONER_MOD set GANG_PRISONER_MOD=%%b
  if %%a==GANG_FIREFIGHTER_MOD set GANG_FIREFIGHTER_MOD=%%b
  if %%a==GANG_AIRLINES_MOD set GANG_AIRLINES_MOD=%%b
  if %%a==GANG_BROTHERHOOD_MOD set GANG_BROTHERHOOD_MOD=%%b
  if %%a==GANG_STREAKER_MOD set GANG_STREAKER_MOD=%%b
  if %%a==GANG_JUDGE_MOD set GANG_JUDGE_MOD=%%b
  if %%a==GANG_REALPIMP_MOD set GANG_REALPIMP_MOD=%%b
  if %%a==GANG_ZOMBIE_MOD set GANG_ZOMBIE_MOD=%%b
  if %%a==GANG_PUNK_MOD set GANG_PUNK_MOD=%%b
  if %%a==GANG_BIKER_MOD set GANG_BIKER_MOD=%%b
  if %%a==GANG_PIRATE_MOD set GANG_PIRATE_MOD=%%b
  if %%a==GANG_SPORT_MOD set GANG_SPORT_MOD=%%b
  if %%a==GANG_WEIRDCOP_MOD set GANG_WEIRDCOP_MOD=%%b
  if %%a==GANG_SAILOR_MOD set GANG_SAILOR_MOD=%%b
  if %%a==GANG_FOOD_MOD set GANG_FOOD_MOD=%%b
  if %%a==GANG_MAIN_SAINTS_MOD set GANG_MAIN_SAINTS_MOD=%%b
  if %%a==GANG_MAIN_BROTHERHOOD_MOD set GANG_MAIN_BROTHERHOOD_MOD=%%b
  if %%a==GANG_MAIN_RONIN_MOD set GANG_MAIN_RONIN_MOD=%%b
  if %%a==GANG_MAIN_SAMEDI_MOD set GANG_MAIN_SAMEDI_MOD=%%b
  if %%a==RAPIDFIRE_ROCKET_MOD set RAPIDFIRE_ROCKET_MOD=%%b
  if %%a==SUPER_TORNADO_MOD set SUPER_TORNADO_MOD=%%b
  if %%a==SUPER_TORNADO_NONUKE_MOD set SUPER_TORNADO_NONUKE_MOD=%%b
  if %%a==SATCHEL_NUKE_MOD set SATCHEL_NUKE_MOD=%%b
  if %%a==ALL_WEAPON_MOD set ALL_WEAPON_MOD=%%b
  if %%a==GYRO_ORIGINAL_MOD set GYRO_ORIGINAL_MOD=%%b
  if %%a==PAUSE_TCHOUPA_MOD set PAUSE_TCHOUPA_MOD=%%b
  if %%a==PAUSE_COCONUTS_MOD set PAUSE_COCONUTS_MOD=%%b
  if %%a==PAUSE_ORIGINAL_MOD set PAUSE_ORIGINAL_MOD=%%b
  if %%a==ALL_MUSIC_ORIGINAL_MOD set ALL_MUSIC_ORIGINAL_MOD=%%b
  if %%a==FOV_LEFT_MOD set FOV_LEFT_MOD=%%b
  if %%a==FOV_RIGHT_MOD set FOV_RIGHT_MOD=%%b
  if %%a==ZOMBIE_UPRISING_FBI_MOD set NUDE_MOD=%%b
  if %%a==ZOMBIE_UPRISING_MAERO_MOD set ZOMBIE_UPRISING_MAERO_MOD=%%b
  if %%a==ZOMBIE_UPRISING_JYUNICHI_MOD set ZOMBIE_UPRISING_JYUNICHI_MOD=%%b
  if %%a==ZOMBIE_UPRISING_WONG_MOD set ZOMBIE_UPRISING_WONG_MOD=%%b
  if %%a==ZOMBIE_UPRISING_SUNSHINE_MOD set ZOMBIE_UPRISING_SUNSHINE_MOD=%%b
  if %%a==ZOMBIE_UPRISING_DANE_MOD set ZOMBIE_UPRISING_DANE_MOD=%%b
  if %%a==ZOMBIE_UPRISING_PIERCE_MOD set ZOMBIE_UPRISING_PIERCE_MOD=%%b
  if %%a==VILLAIN_PACK_MOD set VILLAIN_PACK_MOD=%%b
  if %%a==HOMIES_MISC_MOD set HOMIES_MISC_MOD=%%b
  if %%a==GAT_SUIT_MOD set GAT_SUIT_MOD=%%b
  if %%a==POSTGAME_GANG_CONTROL_MOD set POSTGAME_GANG_CONTROL_MOD=%%b
  if %%a==CD_LOC_MOD set CD_LOC_MOD=%%b
  if %%a==CHUNK_SWAP_MOD set CHUNK_SWAP_MOD=%%b
  if %%a==NEW_CRIBS_MOD set NEW_CRIBS_MOD=%%b
  if %%a==OPEN_CHEAT_MOD set OPEN_CHEAT_MOD=%%b
  if %%a==OPEN_PRICING_MOD set OPEN_PRICING_MOD=%%b
  if %%a==OPEN_RESPECT_MOD set OPEN_RESPECT_MOD=%%b
  if %%a==OPEN_WEAPONS_MOD set OPEN_WEAPONS_MOD=%%b
  if %%a==OPEN_NOTORIETY_MOD set OPEN_NOTORIETY_MOD=%%b
  if %%a==OPEN_ALL_MOD set OPEN_ALL_MOD=%%b
  if %%a==WEAPON_MJOLNIR_HOMERUN_MOD set WEAPON_MJOLNIR_HOMERUN_MOD=%%b
)

GOTO MAIN_MENU



REM Reset everything (wipes all mod selections)

:RESET_VARS

SET CONTROL_MENU_PLUS=none
SET SLIDER_MENU_PLUS=none
SET ANIMATION_MENU_PLUS=none
SET GRAPHICS_MENU_PLUS=none
SET CLOTHING_MENU_PLUS=none
SET GANG_MENU_PLUS=none
SET WEAPON_MENU_PLUS=none
SET VEHICLE_MENU_PLUS=none
SET AUDIO_MENU_PLUS=none
SET CAMERA_MENU_PLUS=none
SET MISC_MENU_PLUS=none
SET OPEN_MENU_PLUS=none
SET ZU_MENU_PLUS=none

SET STICKY_CAM_MOD=none
SET HANDLING_MOD=none
SET HUDLESS_MOD=none

SET SUPER_SLIDERS_MOD=none
SET HUGE_MUSCLE_MOD=none
SET HEIGHT3_MOD=none
SET HEIGHT4_MOD=none
SET HEIGHT5_MOD=none
SET HEIGHT7_MOD=none
SET HEIGHT8_MOD=none

SET SKATEBOARDING_MOD=none
SET ROLLERBLADING_MOD=none
SET POLICE_ANIM_MOD=none
SET FEMALE_WALK_ANIM_MOD=none
SET GIRLY_WALK_ANIM_MOD=none

SET GOTR_SPRAY_MOD=none
SET FIGHTBEAUTIES_SPRAY_MOD=none

SET RONINLOGO_MOD=none
SET CRAZY_DOLLAR_MOD=none
SET WINGEDFLEUR_TAT_MOD=none
SET GENKI_TAT_MOD=none
SET SAM_TAT_MOD=none
SET WARDROBE_COLOR_MOD=none

SET GANG_MEDICAL_MOD=none
SET GANG_MIME_MOD=none
SET GANG_RONIN_MOD=none
SET GANG_BEACH_MOD=none
SET GANG_EXEC_MOD=none

SET GANG_LAW_MOD=none
SET GANG_BARBERSHOP_MOD=none
SET GANG_NUCLEAR_MOD=none
SET GANG_COWBOY_MOD=none
SET GANG_STRIPPER_MOD=none

SET GANG_CHEERLEADER_MOD=none
SET GANG_ELDERLY_MOD=none
SET GANG_GOTH_MOD=none
SET GANG_SAMEDI_MOD=none
SET GANG_HIPPIE_MOD=none

SET GANG_BUM_MOD=none
SET GANG_CONSTRUCTION_MOD=none
SET GANG_SCIENTIST_MOD=none
SET GANG_PRISONER_MOD=none
SET GANG_FIREFIGHTER_MOD=none

SET GANG_AIRLINES_MOD=none
SET GANG_BROTHERHOOD_MOD=none
SET GANG_STREAKER_MOD=none
SET GANG_JUDGE_MOD=none

SET GANG_REALPIMP_MOD=none
SET GANG_ZOMBIE_MOD=none

SET GANG_PUNK_MOD=none

SET GANG_BIKER_MOD=none
SET GANG_PIRATE_MOD=none
SET GANG_SPORT_MOD=none
SET GANG_WEIRDCOP_MOD=none
SET GANG_SAILOR_MOD=none
SET GANG_FOOD_MOD=none

SET GANG_MAIN_SAINTS_MOD=none
SET GANG_MAIN_BROTHERHOOD_MOD=none
SET GANG_MAIN_RONIN_MOD=none
SET GANG_MAIN_SAMEDI_MOD=none

SET RAPIDFIRE_ROCKET_MOD=none
SET SUPER_TORNADO_MOD=none
SET SUPER_TORNADO_NONUKE_MOD=none
SET SATCHEL_NUKE_MOD=none
SET ALL_WEAPON_MOD=none

SET GYRO_ORIGINAL_MOD=none

SET PAUSE_TCHOUPA_MOD=none
SET PAUSE_COCONUTS_MOD=none
SET PAUSE_ORIGINAL_MOD=none
SET ALL_MUSIC_ORIGINAL_MOD=none

SET FOV_LEFT_MOD=none
SET FOV_RIGHT_MOD=none

SET ZOMBIE_UPRISING_FBI_MOD=none
SET ZOMBIE_UPRISING_MAERO_MOD=none
SET ZOMBIE_UPRISING_JYUNICHI_MOD=none
SET ZOMBIE_UPRISING_WONG_MOD=none
SET ZOMBIE_UPRISING_SUNSHINE_MOD=none
SET ZOMBIE_UPRISING_DANE_MOD=none
SET ZOMBIE_UPRISING_PIERCE_MOD=none

SET VILLAIN_PACK_MOD=none
SET HOMIES_MISC_MOD=none
SET GAT_SUIT_MOD=none
SET POSTGAME_GANG_CONTROL_MOD=none
SET CD_LOC_MOD=none
SET NEW_CRIBS_MOD=none
SET CHUNK_SWAP_MOD=none

SET OPEN_CHEAT_MOD=none
SET OPEN_PRICING_MOD=none
SET OPEN_RESPECT_MOD=none
SET OPEN_WEAPONS_MOD=none
SET OPEN_NOTORIETY_MOD=none
SET OPEN_ALL_MOD=none
SET WEAPON_MJOLNIR_HOMERUN_MOD=none




:MAIN_MENU

cls
@echo off
color 0b
echo *******************************************************************************
echo *         -=CLEAN=- GOTR v1.9 FANCY ASS OPTIONAL MOD INSTALLER                *
echo *                                                                             *
if '%CONTROL_MENU_PLUS%'=='none' (
echo *   1. Controls and Onscreen Prompts Menu                                     *
)
if '%CONTROL_MENU_PLUS%'=='installed' (
echo * + 1. Controls and Onscreen Prompts Menu                                     *
)
if '%SLIDER_MENU_PLUS%'=='none' (
echo *   2. Character Creation Slider Mods Menu                                    *
)
if '%SLIDER_MENU_PLUS%'=='installed' (
echo * + 2. Character Creation Slider Mods Menu                                    *
)
if '%ANIMATION_MENU_PLUS%'=='none' (
echo *   3. Animation Mods Menu                                                    *
)
if '%ANIMATION_MENU_PLUS%'=='installed' (
echo * + 3. Animation Mods Menu                                                    *
)
if '%GRAPHICS_MENU_PLUS%'=='none' (
echo *   4. Graphics and Textures Mods Menu                                        *
)
if '%GRAPHICS_MENU_PLUS%'=='installed' (
echo * + 4. Graphics and Textures Mods Menu                                        *
)
if '%CLOTHING_MENU_PLUS%'=='none' (
echo *   5. Clothing and Tattoo Mods Menu                                          *
)
if '%CLOTHING_MENU_PLUS%'=='installed' (
echo * + 5. Clothing and Tattoo Mods Menu                                          *
)
if '%GANG_MENU_PLUS%'=='none' (
echo *   6. Extra Gang Types Menu                                                  *
)
if '%GANG_MENU_PLUS%'=='installed' (
echo * + 6. Extra Gang Types Menu                                                  *
)
if '%WEAPON_MENU_PLUS%'=='none' (
echo *   7. Weapons Mod Menu                                                       *
)
if '%WEAPON_MENU_PLUS%'=='installed' (
echo * + 7. Weapons Mod Menu                                                       *
)
if '%VEHICLE_MENU_PLUS%'=='none' (
echo *   8. Vehicles Mod Menu                                                      *
)
if '%VEHICLE_MENU_PLUS%'=='installed' (
echo * + 8. Vehicles Mod Menu                                                      *
)
if '%AUDIO_MENU_PLUS%'=='none' (
echo *   9. Audio Menu                                                             *
)
if '%AUDIO_MENU_PLUS%'=='installed' (
echo * + 9. Audio Menu                                                             *
)
if '%CAMERA_MENU_PLUS%'=='none' (
echo *   10. Camera Menu                                                           *
)
if '%CAMERA_MENU_PLUS%'=='installed' (
echo * + 10. Camera Menu                                                           *
)
if '%MISC_MENU_PLUS%'=='none' (
echo *   11. Misc Menu -Villain Homies, ZU Mall, Postgame gang control, etc        *
)
if '%MISC_MENU_PLUS%'=='installed' (
echo * + 11. Misc Menu -Villain Homies, ZU Mall, Postgame gang control, etc        *
)
if '%OPEN_MENU_PLUS%'=='none' (
echo *   12. Open Menu -non-flagging cheats, infinite respect, $1 pricing-         *
)
if '%OPEN_MENU_PLUS%'=='installed' (
echo * + 12. Open Menu -non-flagging cheats, infinite respect, $1 pricing-         *
)
echo *                                                                             *
echo *                                                                             *
echo *   X. Wipe all optional mods and start over                                  *
echo *   V. Build original boring non-modded vanilla patch if you hate fun         *
echo *   P. BUILD CUSTOM PATCH! - No options selected builds GotR Standard 1.9     *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO CONTROL_MENU
IF '%input%'=='2' GOTO SLIDER_MENU
IF '%input%'=='3' GOTO ANIMATION_MENU
IF '%input%'=='4' GOTO GRAPHICS_MENU
IF '%input%'=='5' GOTO CLOTHING_MENU
IF '%input%'=='6' GOTO EXTRA_GANGS_MENU
IF '%input%'=='7' GOTO WEAPON_MENU
IF '%input%'=='8' GOTO VEHICLE_MENU
IF '%input%'=='9' GOTO AUDIO_MENU
IF '%input%'=='10' GOTO CAMERA_MENU
IF '%input%'=='11' GOTO MISC_MENU
IF '%input%'=='12' GOTO OPEN_MENU
IF /i '%input%'=='X' GOTO RESET_VARS
IF /i '%input%'=='V' GOTO VANILLA
IF /i '%input%'=='P' GOTO BUILD_PATCH

echo.
echo Did you really just type in %input%? Stop for a brief moment, and let your gaze
echo wander up to all of the delightful menu choices above. Now, pick one of them.
pause
GOTO MAIN_MENU










:CONTROL_MENU

cls

@echo off
echo *******************************************************************************
echo *                      CONTROLS AND ONSCREEN PROMPTS MENU                     *
echo *                                                                             *
echo *   - CONTROL MODS FOR KEYBOARD AND MOUSE USERS                               *
echo *                                                                             *
if '%STICKY_CAM_MOD%'=='none' (
echo *   1. Sticky Camera -no auto-centering of camera when driving                *
)
if '%STICKY_CAM_MOD%'=='installed' (
echo * I 1. Sticky Camera -no auto-centering of camera when driving                *
)
if '%HANDLING_MOD%'=='none' (
echo *   2. Handling mod by Ink0gnito -lowers sensitivity for vehicle handling     *
)
if '%HANDLING_MOD%'=='installed' (
echo * I 2. Handling mod by Ink0gnito -lowers sensitivity for vehicle handling     *
)
echo *                                                                             *
echo *                                                                             *
echo *   - MISC MODS                                                               *
echo *                                                                             *
if '%HUDLESS_MOD%'=='none' (
echo *   3. Hudless -Remove the HUD in-game for screenshotting                     *
)
if '%HUDLESS_MOD%'=='installed' (
echo * I 3. Hudless -Remove the HUD in-game for screenshotting                     *
)
echo *                                                                             *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO STICKY_CAM
IF '%input%'=='2' GOTO HANDLING
IF '%input%'=='3' GOTO HUDLESS
IF '%input%'=='0' GOTO CONTROL_MENU_RETURN

echo.
echo Did you really just type in %input%? Stop for a brief moment, and let your gaze
echo wander up to all of the delightful menu choices above. Now, pick one of them.
pause
GOTO CONTROL_MENU

:STICKY_CAM
IF '%STICKY_CAM_MOD%'=='installed' (
SET STICKY_CAM_MOD=none
GOTO CONTROL_MENU
)
SET STICKY_CAM_MOD=installed
GOTO CONTROL_MENU

:HANDLING
IF '%HANDLING_MOD%'=='installed' (
SET HANDLING_MOD=none
GOTO CONTROL_MENU
)
SET HANDLING_MOD=installed
GOTO CONTROL_MENU

:HUDLESS
IF '%HUDLESS_MOD%'=='installed' (
SET HUDLESS_MOD=none
GOTO CONTROL_MENU
)
SET HUDLESS_MOD=installed
GOTO CONTROL_MENU



:CONTROL_MENU_RETURN
SET CONTROL_MENU_PLUS=none
if '%STICKY_CAM_MOD%'=='installed' (SET CONTROL_MENU_PLUS=installed)
if '%HANDLING_MOD%'=='installed' (SET CONTROL_MENU_PLUS=installed)
if '%HUDLESS_MOD%'=='installed' (SET CONTROL_MENU_PLUS=installed)
GOTO MAIN_MENU








:SLIDER_MENU

cls
echo *******************************************************************************
echo *                       CHARACTER CREATION OPTIONAL MODS                      *
echo *                                                                             *
if '%SUPER_SLIDERS_MOD%'=='none' (
echo *   1. Skylion's Super Sliders - Greatly extends the range of all sliders     *
)
if '%SUPER_SLIDERS_MOD%'=='installed' (
echo * I 1. Skylion's Super Sliders - Greatly extends the range of all sliders     *
)
if '%HUGE_MUSCLE_MOD%'=='none' (
echo *   2. Huge Muscles Mod - Boosts visual muscle definition                     *
)
if '%HUGE_MUSCLE_MOD%'=='installed' (
echo * I 2. Huge Muscles Mod - Boosts visual muscle definition                     *
)
if '%HEIGHT3_MOD%'=='none' (
echo *   3. Height 3ft Tall                                                        *
)
if '%HEIGHT3_MOD%'=='installed' (
echo * I 3. Height 3ft Tall                                                        *
)
if '%HEIGHT4_MOD%'=='none' (
echo *   4. Height 4ft Tall                                                        *
)
if '%HEIGHT4_MOD%'=='installed' (
echo * I 4. Height 4ft Tall                                                        *
)
if '%HEIGHT5_MOD%'=='none' (
echo *   5. Height 5ft Tall                                                        *
)
if '%HEIGHT5_MOD%'=='installed' (
echo * I 5. Height 5ft Tall                                                        *
)
if '%HEIGHT7_MOD%'=='none' (
echo *   6. Height 7ft Tall                                                        *
)
if '%HEIGHT7_MOD%'=='installed' (
echo * I 6. Height 7ft Tall                                                        *
)
if '%HEIGHT8_MOD%'=='none' (
echo *   7. Height 8ft Tall                                                        *
)
if '%HEIGHT8_MOD%'=='installed' (
echo * I 7. Height 8ft Tall                                                        *
)
)
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO SUPER_SLIDERS
IF '%input%'=='2' GOTO HUGE_MUSCLES
IF '%input%'=='3' GOTO HEIGHT3
IF '%input%'=='4' GOTO HEIGHT4
IF '%input%'=='5' GOTO HEIGHT5
IF '%input%'=='6' GOTO HEIGHT7
IF '%input%'=='7' GOTO HEIGHT8
IF '%input%'=='0' GOTO SLIDER_RETURN


echo.
echo We are all rooting for you to navigate the menu correctly so you can make
echo strange and fascinating characters. You're not making this easy though by
echo typing in random stuff like %input%.
pause
GOTO SLIDER_MENU

:SUPER_SLIDERS
IF '%SUPER_SLIDERS_MOD%'=='installed' (
SET SUPER_SLIDERS_MOD=none
GOTO SLIDER_MENU
)
SET SUPER_SLIDERS_MOD=installed
GOTO SLIDER_MENU

:HUGE_MUSCLES
IF '%HUGE_MUSCLE_MOD%'=='installed' (
SET HUGE_MUSCLE_MOD=none
GOTO SLIDER_MENU
)
SET HUGE_MUSCLE_MOD=installed
GOTO SLIDER_MENU

:HEIGHT3
IF '%HEIGHT3_MOD%'=='installed' (
SET HEIGHT3_MOD=none
GOTO SLIDER_MENU
)
SET HEIGHT3_MOD=installed
SET HEIGHT4_MOD=none
SET HEIGHT5_MOD=none
SET HEIGHT7_MOD=none
SET HEIGHT8_MOD=none
GOTO SLIDER_MENU

:HEIGHT4
IF '%HEIGHT4_MOD%'=='installed' (
SET HEIGHT4_MOD=none
GOTO SLIDER_MENU
)
SET HEIGHT3_MOD=none
SET HEIGHT4_MOD=installed
SET HEIGHT5_MOD=none
SET HEIGHT7_MOD=none
SET HEIGHT8_MOD=none
GOTO SLIDER_MENU

:HEIGHT5
IF '%HEIGHT5_MOD%'=='installed' (
SET HEIGHT5_MOD=none
GOTO SLIDER_MENU
)
SET HEIGHT3_MOD=none
SET HEIGHT4_MOD=none
SET HEIGHT5_MOD=installed
SET HEIGHT7_MOD=none
SET HEIGHT8_MOD=none
GOTO SLIDER_MENU

:HEIGHT7
IF '%HEIGHT7_MOD%'=='installed' (
SET HEIGHT7_MOD=none
GOTO SLIDER_MENU
)
SET HEIGHT3_MOD=none
SET HEIGHT4_MOD=none
SET HEIGHT5_MOD=none
SET HEIGHT7_MOD=installed
SET HEIGHT8_MOD=none
GOTO SLIDER_MENU

:HEIGHT8
IF '%HEIGHT8_MOD%'=='installed' (
SET HEIGHT8_MOD=none
GOTO SLIDER_MENU
)
SET HEIGHT3_MOD=none
SET HEIGHT4_MOD=none
SET HEIGHT5_MOD=none
SET HEIGHT7_MOD=none
SET HEIGHT8_MOD=installed
GOTO SLIDER_MENU


:SLIDER_RETURN
SET SLIDER_MENU_PLUS=none
if '%SUPER_SLIDERS_MOD%'=='installed' (SET SLIDER_MENU_PLUS=installed)
if '%HUGE_MUSCLE_MOD%'=='installed' (SET SLIDER_MENU_PLUS=installed)
if '%HEIGHT3_MOD%'=='installed' (SET SLIDER_MENU_PLUS=installed)
if '%HEIGHT4_MOD%'=='installed' (SET SLIDER_MENU_PLUS=installed)
if '%HEIGHT5_MOD%'=='installed' (SET SLIDER_MENU_PLUS=installed)
if '%HEIGHT7_MOD%'=='installed' (SET SLIDER_MENU_PLUS=installed)
if '%HEIGHT8_MOD%'=='installed' (SET SLIDER_MENU_PLUS=installed)
GOTO MAIN_MENU









:ANIMATION_MENU

cls
echo *******************************************************************************
echo *                    ANIMATION OPTIONAL MODS                                  *
echo *                                                                             *
if '%SKATEBOARDING_MOD%'=='none' (
echo *   1. Skateboarding Animations for Player                                    *
)
if '%SKATEBOARDING_MOD%'=='installed' (
echo * I 1. Skateboarding Animations for Player                                    *
)
if '%ROLLERBLADING_MOD%'=='none' (
echo *   2. Rollerblading Animations for Player                                    *
)
if '%ROLLERBLADING_MOD%'=='installed' (
echo * I 2. Rollerblading Animations for Player                                    *
)
if '%POLICE_ANIM_MOD%'=='none' (
echo *   3. Police Animations for Player                                           *
)
if '%POLICE_ANIM_MOD%'=='installed' (
echo * I 3. Police Animations for Player                                           *
)
if '%FEMALE_WALK_ANIM_MOD%'=='none' (
echo *   4. Female Weapon Walk Animations for Player                               *
)
if '%FEMALE_WALK_ANIM_MOD%'=='installed' (
echo * I 4. Female Weapon Walk Animations for Player                               *
)
if '%GIRLY_WALK_ANIM_MOD%'=='none' (
echo *   5. Super Girly Animations for Player                                      *
)
if '%GIRLY_WALK_ANIM_MOD%'=='installed' (
echo * I 5. Super Girly Animations for Player                                      *
)
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO SKATEBOARDING
IF '%input%'=='2' GOTO ROLLERBLADING
IF '%input%'=='3' GOTO POLICE_ANIM
IF '%input%'=='4' GOTO FEMALE_WALK_ANIM
IF '%input%'=='5' GOTO GIRLY_WALK_ANIM
IF '%input%'=='0' GOTO ANIMATION_RETURN

echo.
echo Confucius say: He who type like monkey, destined to go bananas.
echo Please try again.
pause
GOTO ANIMATION_MENU


:SKATEBOARDING
IF '%SKATEBOARDING_MOD%'=='installed' (
SET SKATEBOARDING_MOD=none
GOTO ANIMATION_MENU
)
SET SKATEBOARDING_MOD=installed
SET ROLLERBLADING_MOD=none
SET POLICE_ANIM_MOD=none
SET FEMALE_WALK_ANIM_MOD=none
SET GIRLY_WALK_ANIM_MOD=none
GOTO ANIMATION_MENU

:ROLLERBLADING
IF '%ROLLERBLADING_MOD%'=='installed' (
SET ROLLERBLADING_MOD=none
GOTO ANIMATION_MENU
)
SET ROLLERBLADING_MOD=installed
SET SKATEBOARDING_MOD=none
SET POLICE_ANIM_MOD=none
SET FEMALE_WALK_ANIM_MOD=none
SET GIRLY_WALK_ANIM_MOD=none
GOTO ANIMATION_MENU

:POLICE_ANIM
IF '%POLICE_ANIM_MOD%'=='installed' (
SET POLICE_ANIM_MOD=none
GOTO ANIMATION_MENU
)
SET ROLLERBLADING_MOD=none
SET SKATEBOARDING_MOD=none
SET POLICE_ANIM_MOD=installed
SET FEMALE_WALK_ANIM_MOD=none
SET GIRLY_WALK_ANIM_MOD=none
GOTO ANIMATION_MENU

:FEMALE_WALK_ANIM
IF '%FEMALE_WALK_ANIM_MOD%'=='installed' (
SET FEMALE_WALK_ANIM_MOD=none
GOTO ANIMATION_MENU
)
SET ROLLERBLADING_MOD=none
SET SKATEBOARDING_MOD=none
SET POLICE_ANIM_MOD=none
SET FEMALE_WALK_ANIM_MOD=installed
SET GIRLY_WALK_ANIM_MOD=none
GOTO ANIMATION_MENU

:GIRLY_WALK_ANIM
IF '%GIRLY_WALK_ANIM_MOD%'=='installed' (
SET GIRLY_WALK_ANIM_MOD=none
GOTO ANIMATION_MENU
)
SET ROLLERBLADING_MOD=none
SET SKATEBOARDING_MOD=none
SET POLICE_ANIM_MOD=none
SET FEMALE_WALK_ANIM_MOD=none
SET GIRLY_WALK_ANIM_MOD=installed
GOTO ANIMATION_MENU


:ANIMATION_RETURN
SET ANIMATION_MENU_PLUS=none
if '%SKATEBOARDING_MOD%'=='installed' (SET ANIMATION_MENU_PLUS=installed)
if '%ROLLERBLADING_MOD%'=='installed' (SET ANIMATION_MENU_PLUS=installed)
if '%POLICE_ANIM_MOD%'=='installed' (SET ANIMATION_MENU_PLUS=installed)
if '%FEMALE_WALK_ANIM_MOD%'=='installed' (SET ANIMATION_MENU_PLUS=installed)
if '%GIRLY_WALK_ANIM_MOD%'=='installed' (SET ANIMATION_MENU_PLUS=installed)
GOTO MAIN_MENU











:GRAPHICS_MENU

cls
echo *******************************************************************************
echo *                           GRAPHICS OPTIONAL MODS                            *
echo *                                                                             *
if '%GOTR_SPRAY_MOD%'=='none' (
echo *   1. Gentlemen of the Row Spraytag Pack                                     *
)
if '%GOTR_SPRAY_MOD%'=='installed' (
echo * I 1. Gentlemen of the Row Spraytag Pack                                     *
)
if '%FIGHTBEAUTIES_SPRAY_MOD%'=='none' (
echo *   2. Fight Beauties Spray Tags for masayumemasa                             *
)
if '%FIGHTBEAUTIES_SPRAY_MOD%'=='installed' (
echo * I 2. Fight Beauties Spray Tags for masayumemasa                             *
)
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number:

IF '%input%'=='1' GOTO GOTR_SPRAY
IF '%input%'=='2' GOTO FIGHTBEAUTIES_SPRAY
IF '%input%'=='0' GOTO GRAPHICS_RETURN
echo.
echo Confucius say: He who type like monkey, destined to go bananas.
echo Please try again.
pause
GOTO GRAPHICS_MENU


:GOTR_SPRAY
IF '%GOTR_SPRAY_MOD%'=='installed' (
SET GOTR_SPRAY_MOD=none
GOTO GRAPHICS_MENU
)
SET GOTR_SPRAY_MOD=installed
SET FIGHTBEAUTIES_SPRAY_MOD=none
GOTO GRAPHICS_MENU


:FIGHTBEAUTIES_SPRAY
IF '%FIGHTBEAUTIES_SPRAY_MOD%'=='installed' (
SET FIGHTBEAUTIES_SPRAY_MOD=none
GOTO GRAPHICS_MENU
)
SET FIGHTBEAUTIES_SPRAY_MOD=installed
SET GOTR_SPRAY_MOD=none
GOTO GRAPHICS_MENU


:GRAPHICS_RETURN
SET GRAPHICS_MENU_PLUS=none
if '%FIGHTBEAUTIES_SPRAY_MOD%'=='installed' (SET GRAPHICS_MENU_PLUS=installed)
if '%GOTR_SPRAY_MOD%'=='installed' (SET GRAPHICS_MENU_PLUS=installed)
GOTO MAIN_MENU







:CLOTHING_MENU

cls
echo *******************************************************************************
echo *                      CLOTHING AND TATTOO OPTIONAL MODS                      *
echo *                                                                             *
if '%RONINLOGO_MOD%'=='none' (
echo *   1. Remove Dragon Symbol from back of Ronin Jackets                        *
)
if '%RONINLOGO_MOD%'=='installed' (
echo * I 1. Remove Dragon Symbol from back of Ronin Jackets                        *
)
if '%CRAZY_DOLLAR_MOD%'=='none' (
echo *   2. Restore original Dollar Sign textures to Crazy Salesman Jacket         *
)
if '%CRAZY_DOLLAR_MOD%'=='installed' (
echo * I 2. Restore original Dollar Sign textures to Crazy Salesman Jacket         *
)
if '%WARDROBE_COLOR_MOD%'=='none' (
echo *   3. Clothing colors selectable in wardrobe                                 *
)
if '%WARDROBE_COLOR_MOD%'=='installed' (
echo * I 3. Clothing colors selectable in wardrobe                                 *
)
echo *                                                                             *
if '%WINGEDFLEUR_TAT_MOD%'=='none' (
echo *   4. Remove Winged Fleur De Lys Tattoo and replace Upper Back Star          *
)
if '%WINGEDFLEUR_TAT_MOD%'=='installed' (
echo * I 4. Remove Winged Fleur De Lys Tattoo and replace Upper Back Star          *
)
if '%GENKI_TAT_MOD%'=='none' (
echo *   5. Remove Professor Genki Tattoo and replace Upper Back Yin Yang          *
)
if '%GENKI_TAT_MOD%'=='installed' (
echo * I 5. Remove Professor Genki Tattoo and replace Upper Back Yin Yang          *
)
if '%SAM_TAT_MOD%'=='none' (
echo *   6. Remove Flaming Max -Sam and Max- Tatoo and replace Chest Saints        *
)
if '%SAM_TAT_MOD%'=='installed' (
echo * I 6. Remove Flaming Max -Sam and Max- Tatoo and replace Chest Saints        *
)

echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO RONINLOGO
IF '%input%'=='2' GOTO CRAZY_DOLLAR
IF '%input%'=='3' GOTO WARDROBE_COLOR
IF '%input%'=='4' GOTO WINGEDFLEUR_TAT
IF '%input%'=='5' GOTO GENKI_TAT
IF '%input%'=='6' GOTO SAM_TAT

IF '%input%'=='0' GOTO CLOTHING_RETURN

echo.
echo Confucius say: He who type like monkey, destined to go bananas.
echo Please try again.
pause
GOTO CLOTHING_MENU

:RONINLOGO
IF '%RONINLOGO_MOD%'=='installed' (
SET RONINLOGO_MOD=none
GOTO CLOTHING_MENU
)
SET RONINLOGO_MOD=installed
GOTO CLOTHING_MENU

:CRAZY_DOLLAR
IF '%CRAZY_DOLLAR_MOD%'=='installed' (
SET CRAZY_DOLLAR_MOD=none
GOTO CLOTHING_MENU
)
SET CRAZY_DOLLAR_MOD=installed
GOTO CLOTHING_MENU

:WINGEDFLEUR_TAT
IF '%WINGEDFLEUR_TAT_MOD%'=='installed' (
SET WINGEDFLEUR_TAT_MOD=none
GOTO CLOTHING_MENU
)
SET WINGEDFLEUR_TAT_MOD=installed
GOTO CLOTHING_MENU

:GENKI_TAT
IF '%GENKI_TAT_MOD%'=='installed' (
SET GENKI_TAT_MOD=none
GOTO CLOTHING_MENU
)
SET GENKI_TAT_MOD=installed
GOTO CLOTHING_MENU

:SAM_TAT
IF '%SAM_TAT_MOD%'=='installed' (
SET SAM_TAT_MOD=none
GOTO CLOTHING_MENU
)
SET SAM_TAT_MOD=installed
GOTO CLOTHING_MENU

:WARDROBE_COLOR
IF '%WARDROBE_COLOR_MOD%'=='installed' (
SET WARDROBE_COLOR_MOD=none
GOTO CLOTHING_MENU
)
SET WARDROBE_COLOR_MOD=installed
GOTO CLOTHING_MENU


:CLOTHING_RETURN
SET CLOTHING_MENU_PLUS=none
if '%RONINLOGO_MOD%'=='installed' (SET CLOTHING_MENU_PLUS=installed)
if '%CRAZY_DOLLAR_MOD%'=='installed' (SET CLOTHING_MENU_PLUS=installed)
if '%WINGEDFLEUR_TAT_MOD%'=='installed' (SET CLOTHING_MENU_PLUS=installed)
if '%GENKI_TAT_MOD%'=='installed' (SET CLOTHING_MENU_PLUS=installed)
if '%SAM_TAT_MOD%'=='installed' (SET CLOTHING_MENU_PLUS=installed)
if '%WARDROBE_COLOR_MOD%'=='installed' (SET CLOTHING_MENU_PLUS=installed)
GOTO MAIN_MENU















:EXTRA_GANGS_MENU

cls
echo *******************************************************************************
echo *                        EXTRA GANG TYPES MODS PAGE 1                         *
if '%GANG_MEDICAL_MOD%'=='none' (
echo *   1. Medical -Doctors, Nurses, EMT, Patient- Gang Type Replaces 80s         *
)
if '%GANG_MEDICAL_MOD%'=='installed' (
echo * I 1. Medical -Doctors, Nurses, EMT, Patient- Gang Type Replaces 80s         *
)
if '%GANG_MIME_MOD%'=='none' (
echo *   2. Mime Gang Type Replaces 80s                                            *
)
if '%GANG_MIME_MOD%'=='installed' (
echo * I 2. Mime Gang Type Replaces 80s                                            *
)
if '%GANG_RONIN_MOD%'=='none' (
echo *   3. Ronin Gang Type Replaces 80s                                           *
)
if '%GANG_RONIN_MOD%'=='installed' (
echo * I 3. Ronin Gang Type Replaces 80s                                           *
)
if '%GANG_BEACH_MOD%'=='none' (
echo *   4. Beach Gang Type Replaces 80s                                           *
)
if '%GANG_BEACH_MOD%'=='installed' (
echo * I 4. Beach Gang Type Replaces 80s                                           *
)
if '%GANG_EXEC_MOD%'=='none' (
echo *   5. Executive Gang Type Replaces 80s                                       *
)
if '%GANG_EXEC_MOD%'=='installed' (
echo * I 5. Executive Gang Type Replaces 80s                                       *
)
echo *                                                                             *
if '%GANG_LAW_MOD%'=='none' (
echo *   6. Law Enforcement Gang Type Replaces Bodyguard                           *
)
if '%GANG_LAW_MOD%'=='installed' (
echo * I 6. Law Enforcement Gang Type Replaces Bodyguard                           *
)
if '%GANG_BARBERSHOP_MOD%'=='none' (
echo *   7. Barbershop Quartet Gang Type Replaces Bodyguard                        *
)
if '%GANG_BARBERSHOP_MOD%'=='installed' (
echo * I 7. Barbershop Quartet Gang Type Replaces Bodyguard                        *
)
if '%GANG_NUCLEAR_MOD%'=='none' (
echo *   8. Nuclear Gang Type Replaces Bodyguard                                   *
)
if '%GANG_NUCLEAR_MOD%'=='installed' (
echo * I 8. Nuclear Gang Type Replaces Bodyguard                                   *
)
if '%GANG_COWBOY_MOD%'=='none' (
echo *   9. Cowboy Gang Type Replaces Bodyguard                                    *
)
if '%GANG_COWBOY_MOD%'=='installed' (
echo * I 9. Cowboy Gang Type Replaces Bodyguard                                    *
)
if '%GANG_STRIPPER_MOD%'=='none' (
echo *   10. Stripper Gang Type Replaces Bodyguard                                 *
)
if '%GANG_STRIPPER_MOD%'=='installed' (
echo * I 10. Stripper Gang Type Replaces Bodyguard                                 *
)
echo *                                                                             *
if '%GANG_CHEERLEADER_MOD%'=='none' (
echo *   11. Cheerleader Gang Type Replace Gangster                                *
)
if '%GANG_CHEERLEADER_MOD%'=='installed' (
echo * I 11. Cheerleader Gang Type Replace Gangster                                *
)
if '%GANG_ELDERLY_MOD%'=='none' (
echo *   12. Elderly Gang Type Replaces Gangster                                   *
)
if '%GANG_ELDERLY_MOD%'=='installed' (
echo * I 12. Elderly Gang Type Replaces Gangster                                   *
)
if '%GANG_GOTH_MOD%'=='none' (
echo *   13. Goth Gang Type Replaces Gangster                                      *
)
if '%GANG_GOTH_MOD%'=='installed' (
echo * I 13. Goth Gang Type Replaces Gangster                                      *
)
if '%GANG_SAMEDI_MOD%'=='none' (
echo *   14. Samedi Gang Type Replace Gangster                                     *
)
if '%GANG_SAMEDI_MOD%'=='installed' (
echo * I 14. Samedi Gang Type Replace Gangster                                     *
)
if '%GANG_HIPPIE_MOD%'=='none' (
echo *   15. Hippie Gang Type Replace Gangster                                     *
)
if '%GANG_HIPPIE_MOD%'=='installed' (
echo * I 15. Hippie Gang Type Replace Gangster                                     *
)
echo *                                                                             *
echo *   N. Next Page                                                              *
echo *   0. Return to Main Menu                                                    *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO GANG_MEDICAL
IF '%input%'=='2' GOTO GANG_MIME
IF '%input%'=='3' GOTO GANG_RONIN
IF '%input%'=='4' GOTO GANG_BEACH
IF '%input%'=='5' GOTO GANG_EXEC
IF '%input%'=='6' GOTO GANG_LAW
IF '%input%'=='7' GOTO GANG_BARBERSHOP
IF '%input%'=='8' GOTO GANG_NUCLEAR
IF '%input%'=='9' GOTO GANG_COWBOY
IF '%input%'=='10' GOTO GANG_STRIPPER
IF '%input%'=='11' GOTO GANG_CHEERLEADER
IF '%input%'=='12' GOTO GANG_ELDERLY
IF '%input%'=='13' GOTO GANG_GOTH
IF '%input%'=='14' GOTO GANG_SAMEDI
IF '%input%'=='15' GOTO GANG_HIPPIE
IF '%input%'=='0' GOTO EXTRA_GANGS_RETURN
IF /i '%input%'=='N' GOTO EXTRA_GANGS_NEXT

echo.
echo There is both a time and a place for thinking outside of the box.
echo A menu batch file is not one of them.
pause
GOTO EXTRA_GANGS_MENU

:EXTRA_GANGS_NEXT

cls
echo *******************************************************************************
echo *                        EXTRA GANG TYPES MODS PAGE 2                         *
echo *                                                                             *
if '%GANG_BUM_MOD%'=='none' (
echo *   1. Bum and Junky Gang Type Replaces Ninja                                 *
)
if '%GANG_BUM_MOD%'=='installed' (
echo * I 1. Bum and Junky Gang Type Replaces Ninja                                 *
)
if '%GANG_CONSTRUCTION_MOD%'=='none' (
echo *   2. Construction Gang Type Replaces Ninja                                  *
)
if '%GANG_CONSTRUCTION_MOD%'=='installed' (
echo * I 2. Construction Gang Type Replaces Ninja                                  *
)
if '%GANG_SCIENTIST_MOD%'=='none' (
echo *   3. Scientist Gang Type Replaces Ninja                                     *
)
if '%GANG_SCIENTIST_MOD%'=='installed' (
echo * I 3. Scientist Gang Type Replaces Ninja                                     *
)
if '%GANG_PRISONER_MOD%'=='none' (
echo *   4. Prisoner Gang Type Replaces Ninja                                      *
)
if '%GANG_PRISONER_MOD%'=='installed' (
echo * I 4. Prisoner Gang Type Replaces Ninja                                      *
)
if '%GANG_FIREFIGHTER_MOD%'=='none' (
echo *   5. Firefighter Gang Type Replaces Ninja                                   *
)
if '%GANG_FIREFIGHTER_MOD%'=='installed' (
echo * I 5. Firefighter Gang Type Replaces Ninja                                   *
)
echo *                                                                             *
if '%GANG_AIRLINES_MOD%'=='none' (
echo *   6. Airlines Gang Type Replaces Pimps and Hos                              *
)
if '%GANG_AIRLINES_MOD%'=='installed' (
echo * I 6. Airlines Gang Type Replaces Pimps and Hos                              *
)
if '%GANG_BROTHERHOOD_MOD%'=='none' (
echo *   7. Brotherhood Gang Type Replaces Pimps and Hos                           *
)
if '%GANG_BROTHERHOOD_MOD%'=='installed' (
echo * I 7. Brotherhood Gang Type Replaces Pimps and Hos                           *
)
if '%GANG_STREAKER_MOD%'=='none' (
echo *   8. Streaker Gang Type Replaces Pimps and Hos                              *
)
if '%GANG_STREAKER_MOD%'=='installed' (
echo * I 8. Streaker Gang Type Replaces Pimps and Hos                              *
)
if '%GANG_JUDGE_MOD%'=='none' (
echo *   9. Judge Gang Type Replaces Pimps and Hos                                 *
)
if '%GANG_JUDGE_MOD%'=='installed' (
echo * I 9. Judge Gang Type Replaces Pimps and Hos                                 *
)
echo *                                                                             *
if '%GANG_REALPIMP_MOD%'=='none' (
echo *   10. REAL Pimps and Hos Gang Replaces Prephop                              *
)
if '%GANG_REALPIMP_MOD%'=='installed' (
echo * I 10. REAL Pimps and Hos Gang Replaces Prephop                              *
)
if '%GANG_ZOMBIE_MOD%'=='none' (
echo *   11. Zombie Gang Replaces Prephop                                          *
)
if '%GANG_ZOMBIE_MOD%'=='installed' (
echo * I 11. Zombie Gang Replaces Prephop                                          *
)
if '%GANG_FOOD_MOD%'=='none' (
echo *   12. Food -Gyro Goat, Freckle Bitch- Gang Type Replace Prephop             *
)
if '%GANG_FOOD_MOD%'=='installed' (
echo * I 12. Food -Gyro Goat, Freckle Bitch- Gang Type Replace Prephop             *
)
if '%GANG_PUNK_MOD%'=='none' (
echo *   13. Punk Gang Replaces Prephop                                            *
)
if '%GANG_PUNK_MOD%'=='installed' (
echo * I 13. Punk Gang Replaces Prephop                                            *
)
echo *                                                                             *
echo *   B. Back to Previous Page                                                  *
echo *   N. Next Page                                                              *
echo *   0. Return to Main Menu                                                    *
echo *******************************************************************************
echo.
SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO GANG_BUM
IF '%input%'=='2' GOTO GANG_CONSTRUCTION
IF '%input%'=='3' GOTO GANG_SCIENTIST
IF '%input%'=='4' GOTO GANG_PRISONER
IF '%input%'=='5' GOTO GANG_FIREFIGHTER
IF '%input%'=='6' GOTO GANG_AIRLINES
IF '%input%'=='7' GOTO GANG_BROTHERHOOD
IF '%input%'=='8' GOTO GANG_STREAKER
IF '%input%'=='9' GOTO GANG_JUDGE
IF '%input%'=='10' GOTO GANG_REALPIMP
IF '%input%'=='11' GOTO GANG_ZOMBIE
IF '%input%'=='12' GOTO GANG_FOOD
IF '%input%'=='13' GOTO GANG_PUNK
IF '%input%'=='0' GOTO EXTRA_GANGS_RETURN
IF /i '%input%'=='B' GOTO EXTRA_GANGS_MENU
IF /i '%input%'=='N' GOTO EXTRA_GANGS_NEXT2

echo.
echo There is both a time and a place for thinking outside of the box.
echo A menu batch file is not one of them.
pause
GOTO EXTRA_GANGS_NEXT

:EXTRA_GANGS_NEXT2

cls
echo *******************************************************************************
echo *                        EXTRA GANG TYPES MODS PAGE 3                         *
echo *                                                                             *
if '%GANG_BIKER_MOD%'=='none' (
echo *   1. Biker Gang Type Replaces Sporty                                        *
)
if '%GANG_BIKER_MOD%'=='installed' (
echo * I 1. Biker Gang Type Replaces Sporty                                        *
)
if '%GANG_PIRATE_MOD%'=='none' (
echo *   2. Pirate Gang Replaces Sporty                                            *
)
if '%GANG_PIRATE_MOD%'=='installed' (
echo * I 2. Pirate Gang Replaces Sporty                                            *
)
if '%GANG_SPORT_MOD%'=='none' (
echo *   3. Sports Gang Type Replaces Sporty                                       *
)
if '%GANG_SPORT_MOD%'=='installed' (
echo * I 3. Sports Gang Type Replaces Sporty                                       *
)
if '%GANG_WEIRDCOP_MOD%'=='none' (
echo *   4. Weird Cop Gang Type Replaces Sporty                                    *
)
if '%GANG_WEIRDCOP_MOD%'=='installed' (
echo * I 4. Weird Cop Gang Type Replaces Sporty                                    *
)
if '%GANG_SAILOR_MOD%'=='none' (
echo *   5. Sailors Gang Type Replaces Sporty                                      *
)
if '%GANG_SAILOR_MOD%'=='installed' (
echo * I 5. Sailors Gang Type Replaces Sporty                                      *
)
echo *                                                                             *
if '%GANG_MAIN_SAINTS_MOD%'=='none' (
echo *   6. Clone Gang Saints Heroes -Gat,Pierce,Shaundi,Carlos- Replaces Sporty   *
)
if '%GANG_MAIN_SAINTS_MOD%'=='installed' (
echo * I 6. Clone Gang Saints Heroes -Gat,Pierce,Shaundi,Carlos- Replaces Sporty   *
)
if '%GANG_MAIN_BROTHERHOOD_MOD%'=='none' (
echo *   7. Clone Gang Brotherhood -Maero,Jess,Matt,Donnie- Replaces Sporty        *
)
if '%GANG_MAIN_BROTHERHOOD_MOD%'=='installed' (
echo * I 7. Clone Gang Brotherhood -Maero,Jess,Matt,Donnie- Replaces Sporty        *
)
if '%GANG_MAIN_RONIN_MOD%'=='none' (
echo *   8. Clone Gang Ronin -Shogo,Kazuo,Jyunichi,Vogel- Replaces Sporty          *
)
if '%GANG_MAIN_RONIN_MOD%'=='installed' (
echo * I 8. Clone Gang Ronin -Shogo,Kazuo,Jyunichi,Vogel- Replaces Sporty          *
)
if '%GANG_MAIN_SAMEDI_MOD%'=='none' (
echo *   9. Clone Gang Samedi -General,Mr Sunshine,Child- Replaces Sporty          *
)
if '%GANG_MAIN_SAMEDI_MOD%'=='installed' (
echo * I 9. Clone Gang Samedi -General,Mr Sunshine,Child- Replaces Sporty          *
)
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *   B. Back to Previous Page                                                  *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 

IF '%input%'=='1' GOTO GANG_BIKER
IF '%input%'=='2' GOTO GANG_PIRATE
IF '%input%'=='3' GOTO GANG_SPORT
IF '%input%'=='4' GOTO GANG_WEIRDCOP
IF '%input%'=='5' GOTO GANG_SAILOR
IF '%input%'=='6' GOTO GANG_MAIN_SAINTS
IF '%input%'=='7' GOTO GANG_MAIN_BROTHERHOOD
IF '%input%'=='8' GOTO GANG_MAIN_RONIN
IF '%input%'=='9' GOTO GANG_MAIN_SAMEDI
IF '%input%'=='0' GOTO EXTRA_GANGS_RETURN
IF /i '%input%'=='B' GOTO EXTRA_GANGS_NEXT

echo.
echo There is both a time and a place for thinking outside of the box.
echo A menu batch file is not one of them.
pause
GOTO EXTRA_GANGS_NEXT2

:GANG_MEDICAL
IF '%GANG_MEDICAL_MOD%'=='installed' (
SET GANG_MEDICAL_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_MEDICAL_MOD=installed
SET GANG_MIME_MOD=none
SET GANG_RONIN_MOD=none
SET GANG_BEACH_MOD=none
SET GANG_EXEC_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_MIME
IF '%GANG_MIME_MOD%'=='installed' (
SET GANG_MIME_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_MIME_MOD=installed
SET GANG_MEDICAL_MOD=none
SET GANG_RONIN_MOD=none
SET GANG_BEACH_MOD=none
SET GANG_EXEC_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_RONIN
IF '%GANG_RONIN_MOD%'=='installed' (
SET GANG_RONIN_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_RONIN_MOD=installed
SET GANG_MEDICAL_MOD=none
SET GANG_MIME_MOD=none
SET GANG_BEACH_MOD=none
SET GANG_EXEC_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_BEACH
IF '%GANG_BEACH_MOD%'=='installed' (
SET GANG_BEACH_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_BEACH_MOD=installed
SET GANG_MEDICAL_MOD=none
SET GANG_MIME_MOD=none
SET GANG_RONIN_MOD=none
SET GANG_EXEC_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_EXEC
IF '%GANG_EXEC_MOD%'=='installed' (
SET GANG_EXEC_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_EXEC_MOD=installed
SET GANG_MEDICAL_MOD=none
SET GANG_MIME_MOD=none
SET GANG_RONIN_MOD=none
SET GANG_BEACH_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_LAW
IF '%GANG_LAW_MOD%'=='installed' (
SET GANG_LAW_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_LAW_MOD=installed
SET GANG_BARBERSHOP_MOD=none
SET GANG_NUCLEAR_MOD=none
SET GANG_COWBOY_MOD=none
SET GANG_STRIPPER_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_BARBERSHOP
IF '%GANG_BARBERSHOP_MOD%'=='installed' (
SET GANG_BARBERSHOP_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_LAW_MOD=none
SET GANG_BARBERSHOP_MOD=installed
SET GANG_NUCLEAR_MOD=none
SET GANG_COWBOY_MOD=none
SET GANG_STRIPPER_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_NUCLEAR
IF '%GANG_NUCLEAR_MOD%'=='installed' (
SET GANG_NUCLEAR_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_LAW_MOD=none
SET GANG_BARBERSHOP_MOD=none
SET GANG_NUCLEAR_MOD=installed
SET GANG_COWBOY_MOD=none
SET GANG_STRIPPER_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_COWBOY
IF '%GANG_COWBOY_MOD%'=='installed' (
SET GANG_COWBOY_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_LAW_MOD=none
SET GANG_BARBERSHOP_MOD=none
SET GANG_NUCLEAR_MOD=none
SET GANG_COWBOY_MOD=installed
SET GANG_STRIPPER_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_STRIPPER
IF '%GANG_STRIPPER_MOD%'=='installed' (
SET GANG_STRIPPER_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_LAW_MOD=none
SET GANG_BARBERSHOP_MOD=none
SET GANG_NUCLEAR_MOD=none
SET GANG_COWBOY_MOD=none
SET GANG_STRIPPER_MOD=installed
GOTO EXTRA_GANGS_MENU


:GANG_CHEERLEADER
IF '%GANG_CHEERLEADER_MOD%'=='installed' (
SET GANG_CHEERLEADER_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_CHEERLEADER_MOD=installed
SET GANG_ELDERLY_MOD=none
SET GANG_GOTH_MOD=none
SET GANG_SAMEDI_MOD=none
SET GANG_HIPPIE_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_ELDERLY
IF '%GANG_ELDERLY_MOD%'=='installed' (
SET GANG_ELDERLY_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_CHEERLEADER_MOD=none
SET GANG_ELDERLY_MOD=installed
SET GANG_GOTH_MOD=none
SET GANG_SAMEDI_MOD=none
SET GANG_HIPPIE_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_GOTH
IF '%GANG_GOTH_MOD%'=='installed' (
SET GANG_GOTH_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_CHEERLEADER_MOD=none
SET GANG_ELDERLY_MOD=none
SET GANG_GOTH_MOD=installed
SET GANG_SAMEDI_MOD=none
SET GANG_HIPPIE_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_SAMEDI
IF '%GANG_SAMEDI_MOD%'=='installed' (
SET GANG_SAMEDI_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_CHEERLEADER_MOD=none
SET GANG_ELDERLY_MOD=none
SET GANG_GOTH_MOD=none
SET GANG_SAMEDI_MOD=installed
SET GANG_HIPPIE_MOD=none
GOTO EXTRA_GANGS_MENU

:GANG_HIPPIE
IF '%GANG_HIPPIE_MOD%'=='installed' (
SET GANG_HIPPIE_MOD=none
GOTO EXTRA_GANGS_MENU
)
SET GANG_CHEERLEADER_MOD=none
SET GANG_ELDERLY_MOD=none
SET GANG_GOTH_MOD=none
SET GANG_SAMEDI_MOD=none
SET GANG_HIPPIE_MOD=installed
GOTO EXTRA_GANGS_MENU




:GANG_BUM
IF '%GANG_BUM_MOD%'=='installed' (
SET GANG_BUM_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_BUM_MOD=installed
SET GANG_CONSTRUCTION_MOD=none
SET GANG_SCIENTIST_MOD=none
SET GANG_PRISONER_MOD=none
SET GANG_FIREFIGHTER_MOD=none
GOTO EXTRA_GANGS_NEXT

:GANG_CONSTRUCTION
IF '%GANG_CONSTRUCTION_MOD%'=='installed' (
SET GANG_CONSTRUCTION_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_BUM_MOD=none
SET GANG_CONSTRUCTION_MOD=installed
SET GANG_SCIENTIST_MOD=none
SET GANG_PRISONER_MOD=none
SET GANG_FIREFIGHTER_MOD=none
GOTO EXTRA_GANGS_NEXT

:GANG_SCIENTIST
IF '%GANG_SCIENTIST_MOD%'=='installed' (
SET GANG_SCIENTIST_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_BUM_MOD=none
SET GANG_CONSTRUCTION_MOD=none
SET GANG_SCIENTIST_MOD=installed
SET GANG_PRISONER_MOD=none
SET GANG_FIREFIGHTER_MOD=none
GOTO EXTRA_GANGS_NEXT

:GANG_PRISONER
IF '%GANG_PRISONER_MOD%'=='installed' (
SET GANG_PRISONER_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_BUM_MOD=none
SET GANG_CONSTRUCTION_MOD=none
SET GANG_SCIENTIST_MOD=none
SET GANG_PRISONER_MOD=installed
SET GANG_FIREFIGHTER_MOD=none
GOTO EXTRA_GANGS_NEXT

:GANG_FIREFIGHTER
IF '%GANG_FIREFIGHTER_MOD%'=='installed' (
SET GANG_FIREFIGHTER_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_BUM_MOD=none
SET GANG_CONSTRUCTION_MOD=none
SET GANG_SCIENTIST_MOD=none
SET GANG_PRISONER_MOD=none
SET GANG_FIREFIGHTER_MOD=installed
GOTO EXTRA_GANGS_NEXT

:GANG_AIRLINES
IF '%GANG_AIRLINES_MOD%'=='installed' (
SET GANG_AIRLINES_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_AIRLINES_MOD=installed
SET GANG_BROTHERHOOD_MOD=none
SET GANG_STREAKER_MOD=none
SET GANG_JUDGE_MOD=none
GOTO EXTRA_GANGS_NEXT

:GANG_BROTHERHOOD
IF '%GANG_BROTHERHOOD_MOD%'=='installed' (
SET GANG_BROTHERHOOD_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_AIRLINES_MOD=none
SET GANG_BROTHERHOOD_MOD=installed
SET GANG_STREAKER_MOD=none
SET GANG_JUDGE_MOD=none
GOTO EXTRA_GANGS_NEXT

:GANG_STREAKER
IF '%GANG_STREAKER_MOD%'=='installed' (
SET GANG_STREAKER_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_AIRLINES_MOD=none
SET GANG_BROTHERHOOD_MOD=none
SET GANG_STREAKER_MOD=installed
SET GANG_JUDGE_MOD=none
GOTO EXTRA_GANGS_NEXT

:GANG_JUDGE
IF '%GANG_JUDGE_MOD%'=='installed' (
SET GANG_JUDGE_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_AIRLINES_MOD=none
SET GANG_BROTHERHOOD_MOD=none
SET GANG_STREAKER_MOD=none
SET GANG_JUDGE_MOD=installed
GOTO EXTRA_GANGS_NEXT



:GANG_REALPIMP
IF '%GANG_REALPIMP_MOD%'=='installed' (
SET GANG_REALPIMP_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_REALPIMP_MOD=installed
SET GANG_ZOMBIE_MOD=none
SET GANG_PUNK_MOD=none
SET GANG_FOOD_MOD=none
GOTO EXTRA_GANGS_NEXT

:GANG_ZOMBIE
IF '%GANG_ZOMBIE_MOD%'=='installed' (
SET GANG_ZOMBIE_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_REALPIMP_MOD=none
SET GANG_ZOMBIE_MOD=installed
SET GANG_PUNK_MOD=none
SET GANG_FOOD_MOD=none
GOTO EXTRA_GANGS_NEXT

:GANG_FOOD
IF '%GANG_FOOD_MOD%'=='installed' (
SET GANG_FOOD_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_REALPIMP_MOD=none
SET GANG_ZOMBIE_MOD=none
SET GANG_PUNK_MOD=none
SET GANG_FOOD_MOD=installed
GOTO EXTRA_GANGS_NEXT

:GANG_PUNK
IF '%GANG_PUNK_MOD%'=='installed' (
SET GANG_PUNK_MOD=none
GOTO EXTRA_GANGS_NEXT
)
SET GANG_REALPIMP_MOD=none
SET GANG_ZOMBIE_MOD=none
SET GANG_PUNK_MOD=installed
SET GANG_FOOD_MOD=none
GOTO EXTRA_GANGS_NEXT





:GANG_BIKER
IF '%GANG_BIKER_MOD%'=='installed' (
SET GANG_BIKER_MOD=none
GOTO EXTRA_GANGS_NEXT2
)
SET GANG_BIKER_MOD=installed
SET GANG_PIRATE_MOD=none
SET GANG_SPORT_MOD=none
SET GANG_MAIN_SAINTS_MOD=none
SET GANG_MAIN_BROTHERHOOD_MOD=none
SET GANG_MAIN_RONIN_MOD=none
SET GANG_MAIN_SAMEDI_MOD=none
SET GANG_WEIRDCOP_MOD=none
SET GANG_SAILOR_MOD=none
GOTO EXTRA_GANGS_NEXT2

:GANG_PIRATE
IF '%GANG_PIRATE_MOD%'=='installed' (
SET GANG_PIRATE_MOD=none
GOTO EXTRA_GANGS_NEXT2
)
SET GANG_BIKER_MOD=none
SET GANG_PIRATE_MOD=installed
SET GANG_SPORT_MOD=none
SET GANG_MAIN_SAINTS_MOD=none
SET GANG_MAIN_BROTHERHOOD_MOD=none
SET GANG_MAIN_RONIN_MOD=none
SET GANG_MAIN_SAMEDI_MOD=none
SET GANG_WEIRDCOP_MOD=none
SET GANG_SAILOR_MOD=none
GOTO EXTRA_GANGS_NEXT2

:GANG_SPORT
IF '%GANG_SPORT_MOD%'=='installed' (
SET GANG_SPORT_MOD=none
GOTO EXTRA_GANGS_NEXT2
)
SET GANG_BIKER_MOD=none
SET GANG_PIRATE_MOD=none
SET GANG_SPORT_MOD=installed
SET GANG_MAIN_SAINTS_MOD=none
SET GANG_MAIN_BROTHERHOOD_MOD=none
SET GANG_MAIN_RONIN_MOD=none
SET GANG_MAIN_SAMEDI_MOD=none
SET GANG_WEIRDCOP_MOD=none
SET GANG_SAILOR_MOD=none
GOTO EXTRA_GANGS_NEXT2

:GANG_WEIRDCOP
IF '%GANG_WEIRDCOP_MOD%'=='installed' (
SET GANG_WEIRDCOP_MOD=none
GOTO EXTRA_GANGS_NEXT2
)
SET GANG_BIKER_MOD=none
SET GANG_PIRATE_MOD=none
SET GANG_SPORT_MOD=none
SET GANG_MAIN_SAINTS_MOD=none
SET GANG_MAIN_BROTHERHOOD_MOD=none
SET GANG_MAIN_RONIN_MOD=none
SET GANG_MAIN_SAMEDI_MOD=none
SET GANG_WEIRDCOP_MOD=installed
SET GANG_SAILOR_MOD=none
GOTO EXTRA_GANGS_NEXT2

:GANG_SAILOR
IF '%GANG_SAILOR_MOD%'=='installed' (
SET GANG_SAILOR_MOD=none
GOTO EXTRA_GANGS_NEXT2
)
SET GANG_BIKER_MOD=none
SET GANG_PIRATE_MOD=none
SET GANG_SPORT_MOD=none
SET GANG_MAIN_SAINTS_MOD=none
SET GANG_MAIN_BROTHERHOOD_MOD=none
SET GANG_MAIN_RONIN_MOD=none
SET GANG_MAIN_SAMEDI_MOD=none
SET GANG_WEIRDCOP_MOD=none
SET GANG_SAILOR_MOD=installed
GOTO EXTRA_GANGS_NEXT2





:GANG_MAIN_SAINTS
IF '%GANG_MAIN_SAINTS_MOD%'=='installed' (
SET GANG_MAIN_SAINTS_MOD=none
GOTO EXTRA_GANGS_NEXT2
)
SET GANG_BIKER_MOD=none
SET GANG_PIRATE_MOD=none
SET GANG_SPORT_MOD=none
SET GANG_MAIN_SAINTS_MOD=installed
SET GANG_MAIN_BROTHERHOOD_MOD=none
SET GANG_MAIN_RONIN_MOD=none
SET GANG_MAIN_SAMEDI_MOD=none
SET GANG_WEIRDCOP_MOD=none
SET GANG_SAILOR_MOD=none
GOTO EXTRA_GANGS_NEXT2

:GANG_MAIN_BROTHERHOOD
IF '%GANG_MAIN_BROTHERHOOD_MOD%'=='installed' (
SET GANG_MAIN_BROTHERHOOD_MOD=none
GOTO EXTRA_GANGS_NEXT2
)
SET GANG_BIKER_MOD=none
SET GANG_PIRATE_MOD=none
SET GANG_SPORT_MOD=none
SET GANG_MAIN_SAINTS_MOD=none
SET GANG_MAIN_BROTHERHOOD_MOD=installed
SET GANG_MAIN_RONIN_MOD=none
SET GANG_MAIN_SAMEDI_MOD=none
SET GANG_WEIRDCOP_MOD=none
SET GANG_SAILOR_MOD=none
GOTO EXTRA_GANGS_NEXT2

:GANG_MAIN_RONIN
IF '%GANG_MAIN_RONIN_MOD%'=='installed' (
SET GANG_MAIN_RONIN_MOD=none
GOTO EXTRA_GANGS_NEXT2
)
SET GANG_BIKER_MOD=none
SET GANG_PIRATE_MOD=none
SET GANG_SPORT_MOD=none
SET GANG_MAIN_SAINTS_MOD=none
SET GANG_MAIN_BROTHERHOOD_MOD=none
SET GANG_MAIN_RONIN_MOD=installed
SET GANG_MAIN_SAMEDI_MOD=none
SET GANG_WEIRDCOP_MOD=none
SET GANG_SAILOR_MOD=none
GOTO EXTRA_GANGS_NEXT2

:GANG_MAIN_SAMEDI
IF '%GANG_MAIN_SAMEDI_MOD%'=='installed' (
SET GANG_MAIN_SAMEDI_MOD=none
GOTO EXTRA_GANGS_NEXT2
)
SET GANG_BIKER_MOD=none
SET GANG_PIRATE_MOD=none
SET GANG_SPORT_MOD=none
SET GANG_MAIN_SAINTS_MOD=none
SET GANG_MAIN_BROTHERHOOD_MOD=none
SET GANG_MAIN_RONIN_MOD=none
SET GANG_MAIN_SAMEDI_MOD=installed
SET GANG_WEIRDCOP_MOD=none
SET GANG_SAILOR_MOD=none
GOTO EXTRA_GANGS_NEXT2



:EXTRA_GANGS_RETURN
SET GANG_MENU_PLUS=none
if '%GANG_MEDICAL_MOD%'=='installed' (SET GANG_MENU_PLUS_PLUS=installed)
if '%GANG_MIME_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_RONIN_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_BEACH_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_EXEC_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)

if '%GANG_LAW_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_BARBERSHOP_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_NUCLEAR_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_COWBOY_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_STRIPPER_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)

if '%GANG_CHEERLEADER_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_ELDERLY_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_GOTH_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_SAMEDI_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_HIPPIE_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)

if '%GANG_BUM_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_CONSTRUCTION_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_SCIENTIST_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_PRISONER_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_FIREFIGHTER_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)

if '%GANG_AIRLINES_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_BROTHERHOOD_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_STREAKER_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_JUDGE_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)

if '%GANG_REALPIMP_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_ZOMBIE_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_FOOD_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_PUNK_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)

if '%GANG_BIKER_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_PIRATE_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_SPORT_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_WEIRDCOP_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_SAILOR_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)

if '%GANG_MAIN_SAINTS_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_MAIN_BROTHERHOOD_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_MAIN_RONIN_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)
if '%GANG_MAIN_SAMEDI_MOD%'=='installed' (SET GANG_MENU_PLUS=installed)

GOTO MAIN_MENU









:WEAPON_MENU

cls
echo *******************************************************************************
echo *                            WEAPON OPTIONAL MODS                             *
echo *                                                                             *
echo *                                 !WARNINGS!
echo *      Weapon mods are incompatible in coop unless both players use them!     *
echo *             ALL enemies also get upgraded when using! BE CAREFUL!           *
echo *                                                                             *
if '%RAPIDFIRE_ROCKET_MOD%'=='none' (
echo *   1. Rapid fire Rocket Launcher plus unlimited rockets                      *
)
if '%RAPIDFIRE_ROCKET_MOD%'=='installed' (
echo * I 1. Rapid fire Rocket Launcher plus unlimited rockets                      *
)
if '%SUPER_TORNADO_MOD%'=='none' (
echo *   2. Super Nuke Tornado -rapidfire, nuke explosions, High HP-               *
)
if '%SUPER_TORNADO_MOD%'=='installed' (
echo * I 2. Super Nuke Tornado -rapidfire, nuke explosions, High HP-               *
)
if '%SUPER_TORNADO_NONUKE_MOD%'=='none' (
echo *   3. Super Tornado -Same as above but with no nukes                         *
)
if '%SUPER_TORNADO_NONUKE_MOD%'=='installed' (
echo * I 3. Super Tornado -Same as above but with no nukes                         *
)
if '%SATCHEL_NUKE_MOD%'=='none' (
echo *   4. Satchel Charge Mini-Nukes plus unlimited satchels                      *
)
if '%SATCHEL_NUKE_MOD%'=='installed' (
echo * I 4. Satchel Charge Mini-Nukes plus unlimited satchels                      *
)
if '%WEAPON_MJOLNIR_HOMERUN_MOD%'=='none' (
echo *   5. Mjolnir Sledgehammer and Homerun Baseball Bat                          *
)
if '%WEAPON_MJOLNIR_HOMERUN_MOD%'=='installed' (
echo * I 5. Mjolnir Sledgehammer and Homerun Baseball Bat                          *
)
if '%ALL_WEAPON_MOD%'=='none' (
echo *   6. Install all of the above weapon mods                                   *
)
if '%ALL_WEAPON_MOD%'=='installed' (
echo * I 6. Install all of the above weapon mods                                   *
)
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO RAPIDFIRE_ROCKET
IF '%input%'=='2' GOTO SUPER_TORNADO
IF '%input%'=='3' GOTO SUPER_TORNADO_NONUKE
IF '%input%'=='4' GOTO SATCHEL_NUKE
IF '%input%'=='5' GOTO WEAPON_MJOLNIR_HOMERUN
IF '%input%'=='6' GOTO ALL_WEAPON
IF '%input%'=='0' GOTO WEAPON_RETURN

echo.
echo Confucius say: He who type like monkey, destined to go bananas.
echo Please try again.
pause
GOTO WEAPON_MENU

:RAPIDFIRE_ROCKET
IF '%RAPIDFIRE_ROCKET_MOD%'=='installed' (
SET RAPIDFIRE_ROCKET_MOD=none
GOTO WEAPON_MENU
)
SET RAPIDFIRE_ROCKET_MOD=installed
SET SUPER_TORNADO_MOD=none
SET SUPER_TORNADO_NONUKE_MOD=none
SET SATCHEL_NUKE_MOD=none
SET WEAPON_MJOLNIR_HOMERUN_MOD=none
SET ALL_WEAPON_MOD=none
GOTO WEAPON_MENU

:SUPER_TORNADO
IF '%SUPER_TORNADO_MOD%'=='installed' (
SET SUPER_TORNADO_MOD=none
GOTO WEAPON_MENU
)
SET RAPIDFIRE_ROCKET_MOD=none
SET SUPER_TORNADO_MOD=installed
SET SUPER_TORNADO_NONUKE_MOD=none
SET SATCHEL_NUKE_MOD=none
SET WEAPON_MJOLNIR_HOMERUN_MOD=none
SET ALL_WEAPON_MOD=none
GOTO WEAPON_MENU

:SUPER_TORNADO_NONUKE
IF '%SUPER_TORNADO_NONUKE_MOD%'=='installed' (
SET SUPER_TORNADO_NONUKE_MOD=none
GOTO WEAPON_MENU
)
SET RAPIDFIRE_ROCKET_MOD=none
SET SUPER_TORNADO_MOD=none
SET SUPER_TORNADO_NONUKE_MOD=installed
SET SATCHEL_NUKE_MOD=none
SET WEAPON_MJOLNIR_HOMERUN_MOD=none
SET ALL_WEAPON_MOD=none
GOTO WEAPON_MENU

:SATCHEL_NUKE
IF '%SATCHEL_NUKE_MOD%'=='installed' (
SET SATCHEL_NUKE_MOD=none
GOTO WEAPON_MENU
)
SET RAPIDFIRE_ROCKET_MOD=none
SET SUPER_TORNADO_MOD=none
SET SUPER_TORNADO_NONUKE_MOD=none
SET SATCHEL_NUKE_MOD=installed
SET WEAPON_MJOLNIR_HOMERUN_MOD=none
SET ALL_WEAPON_MOD=none
GOTO WEAPON_MENU

:WEAPON_MJOLNIR_HOMERUN
IF '%WEAPON_MJOLNIR_HOMERUN_MOD%'=='installed' (
SET WEAPON_MJOLNIR_HOMERUN_MOD=none
GOTO WEAPON_MENU
)
SET RAPIDFIRE_ROCKET_MOD=none
SET SUPER_TORNADO_MOD=none
SET SUPER_TORNADO_NONUKE_MOD=none
SET SATCHEL_NUKE_MOD=none
SET WEAPON_MJOLNIR_HOMERUN_MOD=installed
SET ALL_WEAPON_MOD=none
GOTO WEAPON_MENU

:ALL_WEAPON
IF '%ALL_WEAPON_MOD%'=='installed' (
SET ALL_WEAPON_MOD=none
GOTO WEAPON_MENU
)
SET RAPIDFIRE_ROCKET_MOD=none
SET SUPER_TORNADO_MOD=none
SET SUPER_TORNADO_NONUKE_MOD=none
SET SATCHEL_NUKE_MOD=none
SET WEAPON_MJOLNIR_HOMERUN_MOD=none
SET ALL_WEAPON_MOD=installed
GOTO WEAPON_MENU

:WEAPON_RETURN
SET WEAPON_MENU_PLUS=none
if '%RAPIDFIRE_ROCKET_MOD%'=='installed' (SET WEAPON_MENU_PLUS=installed)
if '%SUPER_TORNADO_MOD%'=='installed' (SET WEAPON_MENU_PLUS=installed)
if '%SUPER_TORNADO_NONUKE_MOD%'=='installed' (SET WEAPON_MENU_PLUS=installed)
if '%SATCHEL_NUKE_MOD%'=='installed' (SET WEAPON_MENU_PLUS=installed)
if '%WEAPON_MJOLNIR_HOMERUN_MOD%'=='installed' (SET WEAPON_MENU_PLUS=installed)
if '%ALL_WEAPON_MOD%'=='installed' (SET WEAPON_MENU_PLUS=installed)
GOTO MAIN_MENU











:VEHICLE_MENU

cls
echo *******************************************************************************
echo *                           VEHICLES OPTIONAL MODS                            *
echo *                                                                             *
if '%GYRO_ORIGINAL_MOD%'=='none' (
echo *   1. Revert Gyro Daddy to original handling                                 *
)
if '%GYRO_ORIGINAL_MOD%'=='installed' (
echo * I 1. Revert Gyro Daddy to original handling                                 *
)
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO GYRO_ORIGINAL
IF '%input%'=='0' GOTO VEHICLE_RETURN

echo.
echo Confucius say: He who type like monkey, destined to go bananas.
echo Please try again.
pause
GOTO VEHICLE_MENU

:GYRO_ORIGINAL
IF '%GYRO_ORIGINAL_MOD%'=='installed' (
SET GYRO_ORIGINAL_MOD=none
GOTO VEHICLE_MENU
)
SET GYRO_ORIGINAL_MOD=installed
GOTO VEHICLE_MENU

:VEHICLE_RETURN
SET VEHICLE_MENU_PLUS=none
if '%GYRO_ORIGINAL_MOD%'=='installed' (SET VEHICLE_MENU_PLUS=installed)
GOTO MAIN_MENU








:AUDIO_MENU

cls
echo *******************************************************************************
echo *                             AUDIO OPTIONAL MODS                             *
echo *                                                                             *
if '%PAUSE_TCHOUPA_MOD%'=='none' (
echo *   1. Change Pause Menu Music to Tchoupa Twist                               *
)
if '%PAUSE_TCHOUPA_MOD%'=='installed' (
echo * I 1. Change Pause Menu Music to Tchoupa Twist                               *
)
if '%PAUSE_COCONUTS_MOD%'=='none' (
echo *   2. Change Pause Menu Music to Cocounuts                                   *
)
if '%PAUSE_COCONUTS_MOD%'=='installed' (
echo * I 2. Change Pause Menu Music to Cocounuts                                   *
)
if '%PAUSE_ORIGINAL_MOD%'=='none' (
echo *   3. Restore Pause Menu Music to Original                                   *
)
if '%PAUSE_ORIGINAL_MOD%'=='installed' (
echo * I 3. Restore Pause Menu Music to Original                                   *
)
if '%ALL_MUSIC_ORIGINAL_MOD%'=='none' (
echo *   4. Restore Main Menu Hip Hop and Pause Menu Music to Original             *
)
if '%ALL_MUSIC_ORIGINAL_MOD%'=='installed' (
echo * I 4. Restore Main Menu Hip Hop and Pause Menu Music to Original             *
)
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO PAUSE_TCHOUPA
IF '%input%'=='2' GOTO PAUSE_COCONUTS
IF '%input%'=='3' GOTO PAUSE_ORIGINAL
IF '%input%'=='4' GOTO ALL_MUSIC_ORIGINAL
IF '%input%'=='0' GOTO AUDIO_RETURN

echo.
echo Confucius say: He who type like monkey, destined to go bananas.
echo Please try again.
pause
GOTO AUDIO_MENU

:PAUSE_TCHOUPA
IF '%PAUSE_TCHOUPA_MOD%'=='installed' (
SET PAUSE_TCHOUPA_MOD=none
GOTO AUDIO_MENU
)
SET PAUSE_TCHOUPA_MOD=installed
SET PAUSE_COCONUTS_MOD=none
SET PAUSE_ORIGINAL_MOD=none
SET ALL_MUSIC_ORIGINAL_MOD=none
GOTO AUDIO_MENU


:PAUSE_COCONUTS
IF '%PAUSE_COCONUTS_MOD%'=='installed' (
SET PAUSE_COCONUTS_MOD=none
GOTO AUDIO_MENU
)
SET PAUSE_TCHOUPA_MOD=none
SET PAUSE_COCONUTS_MOD=installed
SET PAUSE_ORIGINAL_MOD=none
SET ALL_MUSIC_ORIGINAL_MOD=none
GOTO AUDIO_MENU


:PAUSE_ORIGINAL
IF '%PAUSE_ORIGINAL_MOD%'=='installed' (
SET PAUSE_ORIGINAL_MOD=none
GOTO AUDIO_MENU
)
SET PAUSE_TCHOUPA_MOD=none
SET PAUSE_COCONUTS_MOD=none
SET PAUSE_ORIGINAL_MOD=installed
SET ALL_MUSIC_ORIGINAL_MOD=none
GOTO AUDIO_MENU


:ALL_MUSIC_ORIGINAL
IF '%ALL_MUSIC_ORIGINAL_MOD%'=='installed' (
SET ALL_MUSIC_ORIGINAL_MOD=none
GOTO AUDIO_MENU
)
SET PAUSE_TCHOUPA_MOD=none
SET PAUSE_COCONUTS_MOD=none
SET PAUSE_ORIGINAL_MOD=none
SET ALL_MUSIC_ORIGINAL_MOD=installed
GOTO AUDIO_MENU



:AUDIO_RETURN
SET AUDIO_MENU_PLUS=none
if '%PAUSE_TCHOUPA_MOD%'=='installed' (SET AUDIO_MENU_PLUS=installed)
if '%PAUSE_COCONUTS_MOD%'=='installed' (SET AUDIO_MENU_PLUS=installed)
if '%PAUSE_ORIGINAL_MOD%'=='installed' (SET AUDIO_MENU_PLUS=installed)
if '%ALL_MUSIC_ORIGINAL_MOD%'=='installed' (SET AUDIO_MENU_PLUS=installed)
GOTO MAIN_MENU








:CAMERA_MENU

cls
echo *******************************************************************************
echo *                            CAMERA OPTIONAL MODS                             *
echo *                                                                             *
if '%FOV_LEFT_MOD%'=='none' (
echo *   1. Increase FOV mod - Fine Aim Left Side                                  *
)
if '%FOV_LEFT_MOD%'=='installed' (
echo * I 1. Increase FOV mod - Fine Aim Left Side                                  *
)
if '%FOV_RIGHT_MOD%'=='none' (
echo *   2. Increase FOV mod - Fine Aim Right Side                                 *
)
if '%FOV_RIGHT_MOD%'=='installed' (
echo * I 2. Increase FOV mod - Fine Aim Right Side                                 *
)
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO FOV_LEFT
IF '%input%'=='2' GOTO FOV_RIGHT
IF '%input%'=='0' GOTO CAMERA_RETURN

echo.
echo Confucius say: He who type like monkey, destined to go bananas.
echo Please try again.
pause
GOTO CAMERA_MENU

:FOV_LEFT
IF '%FOV_LEFT_MOD%'=='installed' (
SET FOV_LEFT_MOD=none
GOTO CAMERA_MENU
)
SET FOV_LEFT_MOD=installed
SET FOV_RIGHT_MOD=none
GOTO CAMERA_MENU

:FOV_RIGHT
IF '%FOV_RIGHT_MOD%'=='installed' (
SET FOV_RIGHT_MOD=none
GOTO CAMERA_MENU
)
SET FOV_LEFT_MOD=none
SET FOV_RIGHT_MOD=installed
GOTO CAMERA_MENU

SET FOV_LEFT_MOD=none
SET FOV_RIGHT_MOD=none
GOTO CAMERA_MENU

:CAMERA_RETURN
SET CAMERA_MENU_PLUS=none
if '%FOV_LEFT_MOD%'=='installed' (SET CAMERA_MENU_PLUS=installed)
if '%FOV_RIGHT_MOD%'=='installed' (SET CAMERA_MENU_PLUS=installed)
GOTO MAIN_MENU





:MISC_MENU

cls
echo *******************************************************************************
echo *                             MISC OPTIONAL MODS                              *
echo *                                                                             *
if '%VILLAIN_PACK_MOD%'=='none' (
echo *   1. Villain homie pack                                                     *
)
if '%VILLAIN_PACK_MOD%'=='installed' (
echo * I 1. Villain homie pack                                                     *
)
if '%HOMIES_MISC_MOD%'=='none' (
echo *   2. Misc Homie Pack -Richie, Laura, Crazy Salesman, Translator, etc-       *
)
if '%HOMIES_MISC_MOD%'=='installed' (
echo * I 2. Misc Homie Pack -Richie, Laura, Crazy Salesman, Translator, etc-       *
)
if '%GAT_SUIT_MOD%'=='none' (
echo *   3. Change Johnny Gat homie's default outfit to his classy trial suit      *
)
if '%GAT_SUIT_MOD%'=='installed' (
echo * I 3. Change Johnny Gat homie's default outfit to his classy trial suit      *
)
if '%ZU_MENU_PLUS%'=='none' (
echo *   4. Zombie Uprising at the Mall -Incompatible in Coop unless both have!    *
)
if '%ZU_MENU_PLUS%'=='installed' (
echo * + 4. Zombie Uprising at the Mall -Incompatible in Coop unless both have!    *
)
if '%POSTGAME_GANG_CONTROL_MOD%'=='none' (
echo *   5. Post-game gang control                                                 *
)
if '%POSTGAME_GANG_CONTROL_MOD%'=='installed' (
echo * I 5. Post-game gang control                                                 *
)
if '%CD_LOC_MOD%'=='none' (
echo *   6. Revert GotR CD locations to original                                   *
)
if '%CD_LOC_MOD%'=='installed' (
echo * I 6. Revert GotR CD locations to original                                   *
)
if '%CHUNK_SWAP_MOD%'=='none' (
echo *   7. Sandbox+ - Use codes to teleport and other fun stuff. See readme       *
)
if '%CHUNK_SWAP_MOD%'=='installed' (
echo * I 7. Sandbox+ - Use codes to teleport and other fun stuff. See readme       *
)
if '%NEW_CRIBS_MOD%'=='none' (
echo *   8. New Cribs - Aishas Crib and more! [CGOTR TOGGLE]			      *
)
if '%NEW_CRIBS_MOD%'=='installed' (
echo * I 8. New Cribs - Aishas Crib and more! [CGOTR TOGGLE]			      *
)
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO VILLAIN_PACK
IF '%input%'=='2' GOTO HOMIES_MISC
IF '%input%'=='3' GOTO GAT_SUIT
IF '%input%'=='4' GOTO ZOMBIE_UPRISING
IF '%input%'=='5' GOTO GANG_CONTROL
IF '%input%'=='6' GOTO CD_LOC
IF '%input%'=='7' GOTO CHUNK_SWAP
IF '%input%'=='8' GOTO NEW_CRIBS
IF '%input%'=='0' GOTO MISC_RETURN

echo.
echo Confucius say: He who type like monkey, destined to go bananas.
echo Please try again.
pause
GOTO MISC_MENU

:VILLAIN_PACK
IF '%VILLAIN_PACK_MOD%'=='installed' (
SET VILLAIN_PACK_MOD=none
GOTO MISC_MENU
)
SET VILLAIN_PACK_MOD=installed
SET HOMIES_MISC_MOD=none
GOTO MISC_MENU

:HOMIES_MISC
IF '%HOMIES_MISC_MOD%'=='installed' (
SET HOMIES_MISC_MOD=none
GOTO MISC_MENU
)
SET VILLAIN_PACK_MOD=none
SET HOMIES_MISC_MOD=installed
GOTO MISC_MENU

:GAT_SUIT
IF '%GAT_SUIT_MOD%'=='installed' (
SET GAT_SUIT_MOD=none
GOTO MISC_MENU
)
SET GAT_SUIT_MOD=installed
GOTO MISC_MENU





:ZOMBIE_UPRISING


cls
echo *******************************************************************************
echo *                           ZOMBIE UPRISING MODS                              *
echo *                                                                             *
if '%ZOMBIE_UPRISING_FBI_MOD%'=='none' (
echo *   1. Zombie Uprising at the Mall with FBI and Swat                          *
)
if '%ZOMBIE_UPRISING_FBI_MOD%'=='installed' (
echo * I 1. Zombie Uprising at the Mall with FBI and Swat                          *
)
if '%ZOMBIE_UPRISING_MAERO_MOD%'=='none' (
echo *   2. Zombie Uprising at the Mall with Maero and Carlos                      *
)
if '%ZOMBIE_UPRISING_MAERO_MOD%'=='installed' (
echo * I 2. Zombie Uprising at the Mall with Maero and Carlos                      *
)
if '%ZOMBIE_UPRISING_JYUNICHI_MOD%'=='none' (
echo *   3. Zombie Uprising at the Mall with Jyunichi and Gat                      *
)
if '%ZOMBIE_UPRISING_JYUNICHI_MOD%'=='installed' (
echo * I 3. Zombie Uprising at the Mall with Jyunichi and Gat                      *
)
if '%ZOMBIE_UPRISING_WONG_MOD%'=='none' (
echo *   4. Zombie Uprising at the Mall with Mr Wong and Kazuo Akuji               *
)
if '%ZOMBIE_UPRISING_WONG_MOD%'=='installed' (
echo * I 4. Zombie Uprising at the Mall with Mr Wong and Kazuo Akuji               *
)
if '%ZOMBIE_UPRISING_SUNSHINE_MOD%'=='none' (
echo *   5. Zombie Uprising at the Mall with Mr Sunshine and The General           *
)
if '%ZOMBIE_UPRISING_SUNSHINE_MOD%'=='installed' (
echo * I 5. Zombie Uprising at the Mall with Mr Sunshine and The General           *
)
if '%ZOMBIE_UPRISING_DANE_MOD%'=='none' (
echo *   6. Zombie Uprising at the Mall with Dane Vogel and Shogo Akuji            *
)
if '%ZOMBIE_UPRISING_DANE_MOD%'=='installed' (
echo * I 6. Zombie Uprising at the Mall with Dane Vogel and Shogo Akuji            *
)
if '%ZOMBIE_UPRISING_PIERCE_MOD%'=='none' (
echo *   7. Zombie Uprising at the Mall with Pierce and Shaundi                    *
)
if '%ZOMBIE_UPRISING_PIERCE_MOD%'=='installed' (
echo * I 7. Zombie Uprising at the Mall with Pierce and Shaundi                    *
)
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO ZOMBIE_UPRISING_FBI
IF '%input%'=='2' GOTO ZOMBIE_UPRISING_MAERO
IF '%input%'=='3' GOTO ZOMBIE_UPRISING_JYUNICHI
IF '%input%'=='4' GOTO ZOMBIE_UPRISING_WONG
IF '%input%'=='5' GOTO ZOMBIE_UPRISING_SUNSHINE
IF '%input%'=='6' GOTO ZOMBIE_UPRISING_DANE
IF '%input%'=='7' GOTO ZOMBIE_UPRISING_PIERCE
IF '%input%'=='0' GOTO ZOMBIE_RETURN

echo.
echo Confucius say: He who type like monkey, destined to go bananas.
echo Please try again.
pause
GOTO MISC_MENU





:ZOMBIE_UPRISING_FBI
IF '%ZOMBIE_UPRISING_FBI_MOD%'=='installed' (
SET ZOMBIE_UPRISING_FBI_MOD=none
GOTO ZOMBIE_UPRISING
)
SET ZOMBIE_UPRISING_FBI_MOD=installed
SET ZOMBIE_UPRISING_MAERO_MOD=none
SET ZOMBIE_UPRISING_JYUNICHI_MOD=none
SET ZOMBIE_UPRISING_WONG_MOD=none
SET ZOMBIE_UPRISING_SUNSHINE_MOD=none
SET ZOMBIE_UPRISING_DANE_MOD=none
SET ZOMBIE_UPRISING_PIERCE_MOD=none
GOTO ZOMBIE_UPRISING


:ZOMBIE_UPRISING_MAERO
IF '%ZOMBIE_UPRISING_MAERO_MOD%'=='installed' (
SET ZOMBIE_UPRISING_MAERO_MOD=none
GOTO ZOMBIE_UPRISING
)
SET ZOMBIE_UPRISING_FBI_MOD=none
SET ZOMBIE_UPRISING_MAERO_MOD=installed
SET ZOMBIE_UPRISING_JYUNICHI_MOD=none
SET ZOMBIE_UPRISING_WONG_MOD=none
SET ZOMBIE_UPRISING_SUNSHINE_MOD=none
SET ZOMBIE_UPRISING_DANE_MOD=none
SET ZOMBIE_UPRISING_PIERCE_MOD=none
GOTO ZOMBIE_UPRISING


:ZOMBIE_UPRISING_JYUNICHI
IF '%ZOMBIE_UPRISING_JYUNICHI_MOD%'=='installed' (
SET ZOMBIE_UPRISING_JYUNICHI_MOD=none
GOTO ZOMBIE_UPRISING
)
SET ZOMBIE_UPRISING_FBI_MOD=none
SET ZOMBIE_UPRISING_MAERO_MOD=none
SET ZOMBIE_UPRISING_JYUNICHI_MOD=installed
SET ZOMBIE_UPRISING_WONG_MOD=none
SET ZOMBIE_UPRISING_SUNSHINE_MOD=none
SET ZOMBIE_UPRISING_DANE_MOD=none
SET ZOMBIE_UPRISING_PIERCE_MOD=none
GOTO ZOMBIE_UPRISING


:ZOMBIE_UPRISING_WONG
IF '%ZOMBIE_UPRISING_WONG_MOD%'=='installed' (
SET ZOMBIE_UPRISING_WONG_MOD=none
GOTO ZOMBIE_UPRISING
)
SET ZOMBIE_UPRISING_FBI_MOD=none
SET ZOMBIE_UPRISING_MAERO_MOD=none
SET ZOMBIE_UPRISING_JYUNICHI_MOD=none
SET ZOMBIE_UPRISING_WONG_MOD=installed
SET ZOMBIE_UPRISING_SUNSHINE_MOD=none
SET ZOMBIE_UPRISING_DANE_MOD=none
SET ZOMBIE_UPRISING_PIERCE_MOD=none
GOTO ZOMBIE_UPRISING


:ZOMBIE_UPRISING_SUNSHINE
IF '%ZOMBIE_UPRISING_SUNSHINE_MOD%'=='installed' (
SET ZOMBIE_UPRISING_SUNSHINE_MOD=none
GOTO ZOMBIE_UPRISING
)
SET ZOMBIE_UPRISING_FBI_MOD=none
SET ZOMBIE_UPRISING_MAERO_MOD=none
SET ZOMBIE_UPRISING_JYUNICHI_MOD=none
SET ZOMBIE_UPRISING_WONG_MOD=none
SET ZOMBIE_UPRISING_SUNSHINE_MOD=installed
SET ZOMBIE_UPRISING_DANE_MOD=none
SET ZOMBIE_UPRISING_PIERCE_MOD=none
GOTO ZOMBIE_UPRISING


:ZOMBIE_UPRISING_DANE
IF '%ZOMBIE_UPRISING_DANE_MOD%'=='installed' (
SET ZOMBIE_UPRISING_DANE_MOD=none
GOTO ZOMBIE_UPRISING
)
SET ZOMBIE_UPRISING_FBI_MOD=none
SET ZOMBIE_UPRISING_MAERO_MOD=none
SET ZOMBIE_UPRISING_JYUNICHI_MOD=none
SET ZOMBIE_UPRISING_WONG_MOD=none
SET ZOMBIE_UPRISING_SUNSHINE_MOD=none
SET ZOMBIE_UPRISING_DANE_MOD=installed
SET ZOMBIE_UPRISING_PIERCE_MOD=none
GOTO ZOMBIE_UPRISING


:ZOMBIE_UPRISING_PIERCE
IF '%ZOMBIE_UPRISING_PIERCE_MOD%'=='installed' (
SET ZOMBIE_UPRISING_PIERCE_MOD=none
GOTO ZOMBIE_UPRISING
)
SET ZOMBIE_UPRISING_FBI_MOD=none
SET ZOMBIE_UPRISING_MAERO_MOD=none
SET ZOMBIE_UPRISING_JYUNICHI_MOD=none
SET ZOMBIE_UPRISING_WONG_MOD=none
SET ZOMBIE_UPRISING_SUNSHINE_MOD=none
SET ZOMBIE_UPRISING_DANE_MOD=none
SET ZOMBIE_UPRISING_PIERCE_MOD=installed
GOTO ZOMBIE_UPRISING


:ZOMBIE_RETURN
SET ZU_MENU_PLUS=none
if '%ZOMBIE_UPRISING_FBI_MOD%'=='installed' (SET ZU_MENU_PLUS=installed)
if '%ZOMBIE_UPRISING_MAERO_MOD%'=='installed' (SET ZU_MENU_PLUS=installed)
if '%ZOMBIE_UPRISING_JYUNICHI_MOD%'=='installed' (SET ZU_MENU_PLUS=installed)
if '%ZOMBIE_UPRISING_WONG_MOD%'=='installed' (SET ZU_MENU_PLUS=installed)
if '%ZOMBIE_UPRISING_SUNSHINE_MOD%'=='installed' (SET ZU_MENU_PLUS=installed)
if '%ZOMBIE_UPRISING_DANE_MOD%'=='installed' (SET ZU_MENU_PLUS=installed)
if '%ZOMBIE_UPRISING_PIERCE_MOD%'=='installed' (SET ZU_MENU_PLUS=installed)
GOTO MISC_MENU









:GANG_CONTROL
IF '%POSTGAME_GANG_CONTROL_MOD%'=='installed' (
SET POSTGAME_GANG_CONTROL_MOD=none
GOTO MISC_MENU
)
cls
echo.
echo                                      WARNING!
echo.
echo     Are you totally sure about installing this? The Post-game Gang Control
echo     mod removes the hood unlocks for one territory for each rival gang. You
echo     will never gain control of these three territories if installed!
echo.
echo     You'll also need to start a new save if already past these missions!
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
pause
SET POSTGAME_GANG_CONTROL_MOD=installed
GOTO MISC_MENU

:CD_LOC
IF '%CD_LOC_MOD%'=='installed' (
SET CD_LOC_MOD=none
GOTO MISC_MENU
)
SET CD_LOC_MOD=installed
GOTO MISC_MENU


:CHUNK_SWAP
IF '%CHUNK_SWAP_MOD%'=='installed' (
SET CHUNK_SWAP_MOD=none
GOTO MISC_MENU
)
SET CHUNK_SWAP_MOD=installed
GOTO MISC_MENU

:NEW_CRIBS
IF '%NEW_CRIBS_MOD%'=='installed' (
SET NEW_CRIBS_MOD=none
GOTO MISC_MENU
)
SET NEW_CRIBS_MOD=installed
GOTO MISC_MENU


:MISC_RETURN
SET MISC_MENU_PLUS=none
if '%VILLAIN_PACK_MOD%'=='installed' (SET MISC_MENU_PLUS=installed)
if '%HOMIES_MISC_MOD%'=='installed' (SET MISC_MENU_PLUS=installed)
if '%GAT_SUIT_MOD%'=='installed' (SET MISC_MENU_PLUS=installed)
if '%ZOMBIE_UPRISING_MOD%'=='installed' (SET MISC_MENU_PLUS=installed)
if '%POSTGAME_GANG_CONTROL_MOD%'=='installed' (SET MISC_MENU_PLUS=installed)
if '%CD_LOC_MOD%'=='installed' (SET MISC_MENU_PLUS=installed)
if '%CHUNK_SWAP_MOD%'=='installed' (SET MISC_MENU_PLUS=installed)
if '%NEW_CRIBS_MOD%'=='installed' (SET MISC_MENU_PLUS=installed)
if '%ZU_MENU_PLUS%'=='installed' (SET MISC_MENU_PLUS=installed)

GOTO MAIN_MENU










:OPEN_MENU

cls
echo *******************************************************************************
echo *                              OPEN CHEAT MODS                                *
echo *                                                                             *
if '%OPEN_CHEAT_MOD%'=='none' (
echo *   1. Open Cheats -Cheats no longer flag save- *Except Low Gravity           *
)
if '%OPEN_CHEAT_MOD%'=='installed' (
echo * I 1. Open Cheats -Cheats no longer flag save- *Except Low Gravity           *
)
if '%OPEN_PRICING_MOD%'=='none' (
echo *   2. Open Pricing -All in-game pricing $1 for clothes, cars, ammo, etc-     *
)
if '%OPEN_PRICING_MOD%'=='installed' (
echo * I 2. Open Pricing -All in-game pricing $1 for clothes, cars, ammo, etc-     *
)
if '%OPEN_RESPECT_MOD%'=='none' (
echo *   3. Open Respect -Infinite Respect generated by driving in oncoming lane-  *
)
if '%OPEN_RESPECT_MOD%'=='installed' (
echo * I 3. Open Respect -Infinite Respect generated by driving in oncoming lane-  *
)
if '%OPEN_WEAPONS_MOD%'=='none' (
echo *   4. Open Weapons for sale -All weapons immediately for sale at stores-     *
)
if '%OPEN_WEAPONS_MOD%'=='installed' (
echo * I 4. Open Weapons for sale -All weapons immediately for sale at stores-     *
)
if '%OPEN_NOTORIETY_MOD%'=='none' (
echo *   5. Open notoriety -Forced to zero stars for all actions in open world-    *
)
if '%OPEN_NOTORIETY_MOD%'=='installed' (
echo * I 5. Open notoriety -Forced to zero stars for all actions in open world-    *
)
if '%OPEN_ALL_MOD%'=='none' (
echo *   6. Install ALL Open Mods above                                            *
)
if '%OPEN_ALL_MOD%'=='installed' (
echo * I 6. Install ALL Open Mods above                                            *
)
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *                                                                             *
echo *   0. Return to Main Menu                                                    *
echo *                                                                             *
echo *******************************************************************************
echo.

SET input=badInput
SET /p input=Type in a menu item number: 
IF '%input%'=='1' GOTO OPEN_CHEAT
IF '%input%'=='2' GOTO OPEN_PRICING
IF '%input%'=='3' GOTO OPEN_RESPECT
IF '%input%'=='4' GOTO OPEN_WEAPONS
IF '%input%'=='5' GOTO OPEN_NOTORIETY
IF '%input%'=='6' GOTO OPEN_ALL
IF '%input%'=='0' GOTO OPEN_RETURN

echo.
echo Confucius say: He who type like monkey, destined to go bananas.
echo Please try again.
pause
GOTO OPEN_MENU

:OPEN_CHEAT
IF '%OPEN_CHEAT_MOD%'=='installed' (
SET OPEN_CHEAT_MOD=none
GOTO OPEN_MENU
)
SET OPEN_CHEAT_MOD=installed
SET OPEN_ALL_MOD=none
GOTO OPEN_MENU

:OPEN_PRICING
IF '%OPEN_PRICING_MOD%'=='installed' (
SET OPEN_PRICING_MOD=none
GOTO OPEN_MENU
)
SET OPEN_PRICING_MOD=installed
SET OPEN_ALL_MOD=none
GOTO OPEN_MENU

:OPEN_RESPECT
IF '%OPEN_RESPECT_MOD%'=='installed' (
SET OPEN_RESPECT_MOD=none
GOTO OPEN_MENU
)
SET OPEN_RESPECT_MOD=installed
SET OPEN_ALL_MOD=none
GOTO OPEN_MENU

:OPEN_WEAPONS
IF '%OPEN_WEAPONS_MOD%'=='installed' (
SET OPEN_WEAPONS_MOD=none
GOTO OPEN_MENU
)
SET OPEN_WEAPONS_MOD=installed
SET OPEN_ALL_MOD=none
GOTO OPEN_MENU

:OPEN_NOTORIETY
IF '%OPEN_NOTORIETY_MOD%'=='installed' (
SET OPEN_NOTORIETY_MOD=none
GOTO OPEN_MENU
)
SET OPEN_NOTORIETY_MOD=installed
SET OPEN_ALL_MOD=none
GOTO OPEN_MENU


:OPEN_ALL
IF '%OPEN_ALL_MOD%'=='installed' (
SET OPEN_ALL_MOD=none
GOTO OPEN_MENU
)
SET OPEN_CHEAT_MOD=none
SET OPEN_PRICING_MOD=none
SET OPEN_RESPECT_MOD=none
SET OPEN_WEAPONS_MOD=none
SET OPEN_NOTORIETY_MOD=none
SET OPEN_ALL_MOD=installed
GOTO OPEN_MENU

:OPEN_RETURN
SET OPEN_MENU_PLUS=none
if '%OPEN_CHEAT_MOD%'=='installed' (SET OPEN_MENU_PLUS=installed)
if '%OPEN_PRICING_MOD%'=='installed' (SET OPEN_MENU_PLUS=installed)
if '%OPEN_RESPECT_MOD%'=='installed' (SET OPEN_MENU_PLUS=installed)
if '%OPEN_WEAPONS_MOD%'=='installed' (SET OPEN_MENU_PLUS=installed)
if '%OPEN_NOTORIETY_MOD%'=='installed' (SET OPEN_MENU_PLUS=installed)
if '%OPEN_ALL_MOD%'=='installed' (SET OPEN_MENU_PLUS=installed)
GOTO MAIN_MENU








:BUILD_PATCH

REM Kill any existing gotr.ini file since we'll be writing new values to it based on user choices. This ini will get parsed on next run
IF EXIST "optional_mod_stuff\gotr.ini" (
del optional_mod_stuff\gotr.ini
)



REM Kill any existing files from previous build
echo deleting existing custom patch
del MY_CUSTOM_PATCH\*.* /Q



REM Dump the base build of GotR (modified) into the temp workspace

echo copying original patch to temp workspace
copy optional_mod_stuff\modified\*.* optional_mod_stuff\tmp_workspace\ /y



REM Check each variable and write to the ini file and/or install the mod

if '%CONTROL_MENU_PLUS%'=='none' (
echo CONTROL_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%CONTROL_MENU_PLUS%'=='installed' (
echo CONTROL_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%SLIDER_MENU_PLUS%'=='none' (
echo SLIDER_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%SLIDER_MENU_PLUS%'=='installed' (
echo SLIDER_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%ANIMATION_MENU_PLUS%'=='none' (
echo ANIMATION_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%ANIMATION_MENU_PLUS%'=='installed' (
echo ANIMATION_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%GRAPHICS_MENU_PLUS%'=='none' (
echo GRAPHICS_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%GRAPHICS_MENU_PLUS%'=='installed' (
echo GRAPHICS_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%CLOTHING_MENU_PLUS%'=='none' (
echo CLOTHING_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%CLOTHING_MENU_PLUS%'=='installed' (
echo CLOTHING_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_MENU_PLUS%'=='none' (
echo GANG_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_MENU_PLUS%'=='installed' (
echo GANG_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%WEAPON_MENU_PLUS%'=='none' (
echo WEAPON_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%WEAPON_MENU_PLUS%'=='installed' (
echo WEAPON_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%VEHICLE_MENU_PLUS%'=='none' (
echo VEHICLE_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%VEHICLE_MENU_PLUS%'=='installed' (
echo VEHICLE_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%AUDIO_MENU_PLUS%'=='none' (
echo AUDIO_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%AUDIO_MENU_PLUS%'=='installed' (
echo AUDIO_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%CAMERA_MENU_PLUS%'=='none' (
echo CAMERA_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%CAMERA_MENU_PLUS%'=='installed' (
echo CAMERA_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%MISC_MENU_PLUS%'=='none' (
echo MISC_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%MISC_MENU_PLUS%'=='installed' (
echo MISC_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%OPEN_MENU_PLUS%'=='none' (
echo OPEN_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%OPEN_MENU_PLUS%'=='installed' (
echo OPEN_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%ZU_MENU_PLUS%'=='none' (
echo ZU_MENU_PLUS=none>> optional_mod_stuff\gotr.ini
)
if '%ZU_MENU_PLUS%'=='installed' (
echo ZU_MENU_PLUS=installed>> optional_mod_stuff\gotr.ini
)

if '%X360_MOD%'=='none' (
echo X360_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%X360_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\onscreen_360\*.* optional_mod_stuff\tmp_workspace\ /y
echo X360_MOD=installed>> optional_mod_stuff\gotr.ini
echo INPUTBIN_360=none>> optional_mod_stuff\gotr.ini
)

if '%INPUTBIN_360%'=='none' (
echo INPUTBIN_360=none>> optional_mod_stuff\gotr.ini
)
if '%INPUTBIN_360%'=='installed' (
echo Copying input.bin
REM Copy input.bin on Vista and Win7 OS
copy optional_mod_stuff\input.bin "%LocalAppData%\THQ\Saints Row 2" /y
REM Copy input.bin on XP
copy optional_mod_stuff\input.bin "%AppData%\THQ\Saints Row 2" /y
echo INPUTBIN_360=none>> optional_mod_stuff\gotr.ini
)

if '%PS3_MOD%'=='none' (
echo PS3_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%PS3_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\onscreen_ps3\*.* optional_mod_stuff\tmp_workspace\ /y
echo PS3_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%INPUTBIN_PS3%'=='none' (
echo INPUTBIN_PS3=none>> optional_mod_stuff\gotr.ini
)
if '%INPUTBIN_PS3%'=='installed' (
echo Copying input.bin
REM Copy input.bin on Vista and Win7 OS
copy optional_mod_stuff\input.bin "%LocalAppData%\THQ\Saints Row 2" /y
REM Copy input.bin on XP
copy optional_mod_stuff\input.bin "%AppData%\THQ\Saints Row 2" /y
echo INPUTBIN_PS3=none>> optional_mod_stuff\gotr.ini
)

if '%STICKY_CAM_MOD%'=='none' (
echo STICKY_CAM_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%STICKY_CAM_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\sticky_camera\*.* optional_mod_stuff\tmp_workspace\ /y
echo STICKY_CAM_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%HANDLING_MOD%'=='none' (
echo HANDLING_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%HANDLING_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\handling_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo HANDLING_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%HUDLESS_MOD%'=='none' (
echo HUDLESS_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%HUDLESS_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\hudless\*.* optional_mod_stuff\tmp_workspace\ /y
echo HUDLESS_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%SUPER_SLIDERS_MOD%'=='none' (
echo SUPER_SLIDERS_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%SUPER_SLIDERS_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\super_sliders\*.* optional_mod_stuff\tmp_workspace\ /y
echo SUPER_SLIDERS_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%HUGE_MUSCLE_MOD%'=='none' (
echo HUGE_MUSCLE_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%HUGE_MUSCLE_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\huge_player_muscles\*.* optional_mod_stuff\tmp_workspace\ /y
echo HUGE_MUSCLE_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%HEIGHT3_MOD%'=='none' (
echo HEIGHT3_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%HEIGHT3_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\height\3ft\*.* optional_mod_stuff\tmp_workspace\ /y
echo HEIGHT3_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%HEIGHT4_MOD%'=='none' (
echo HEIGHT4_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%HEIGHT4_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\height\4ft\*.* optional_mod_stuff\tmp_workspace\ /y
echo HEIGHT4_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%HEIGHT5_MOD%'=='none' (
echo HEIGHT5_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%HEIGHT5_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\height\5ft\*.* optional_mod_stuff\tmp_workspace\ /y
echo HEIGHT5_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%HEIGHT7_MOD%'=='none' (
echo HEIGHT7_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%HEIGHT7_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\height\7ft\*.* optional_mod_stuff\tmp_workspace\ /y
echo HEIGHT7_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%HEIGHT8_MOD%'=='none' (
echo HEIGHT8_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%HEIGHT8_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\height\8ft\*.* optional_mod_stuff\tmp_workspace\ /y
echo HEIGHT8_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%SKATEBOARDING_MOD%'=='none' (
echo SKATEBOARDING_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%SKATEBOARDING_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\sprint_and_run_skateboarding\*.* optional_mod_stuff\tmp_workspace\ /y
echo SKATEBOARDING_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%ROLLERBLADING_MOD%'=='none' (
echo ROLLERBLADING_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%ROLLERBLADING_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\sprint_and_run_rollerblading\*.* optional_mod_stuff\tmp_workspace\ /y
echo ROLLERBLADING_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%POLICE_ANIM_MOD%'=='none' (
echo POLICE_ANIM_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%POLICE_ANIM_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\animation_cop_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo POLICE_ANIM_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%FEMALE_WALK_ANIM_MOD%'=='none' (
echo FEMALE_WALK_ANIM_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%FEMALE_WALK_ANIM_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\animation_female_weapon_walks_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo FEMALE_WALK_ANIM_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GIRLY_WALK_ANIM_MOD%'=='none' (
echo GIRLY_WALK_ANIM_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GIRLY_WALK_ANIM_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\animation_super_girly_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GIRLY_WALK_ANIM_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GOTR_SPRAY_MOD%'=='none' (
echo GOTR_SPRAY_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GOTR_SPRAY_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\spraytag_gotr\*.* optional_mod_stuff\tmp_workspace\ /y
echo GOTR_SPRAY_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%FIGHTBEAUTIES_SPRAY_MOD%'=='none' (
echo FIGHTBEAUTIES_SPRAY_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%FIGHTBEAUTIES_SPRAY_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\spraytag_fightbeauties_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo FIGHTBEAUTIES_SPRAY_MOD=installed>> optional_mod_stuff\gotr.ini
)


if '%RONINLOGO_MOD%'=='none' (
echo RONINLOGO_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%RONINLOGO_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\ronin_jacket_no_symbol\*.* optional_mod_stuff\tmp_workspace\ /y
echo RONINLOGO_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%CRAZY_DOLLAR_MOD%'=='none' (
echo CRAZY_DOLLAR_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%CRAZY_DOLLAR_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\crazy_dollar_original\*.* optional_mod_stuff\tmp_workspace\ /y
echo CRAZY_DOLLAR_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%WINGEDFLEUR_TAT_MOD%'=='none' (
echo WINGEDFLEUR_TAT_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%WINGEDFLEUR_TAT_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\tattoo_original_star\*.* optional_mod_stuff\tmp_workspace\ /y
echo WINGEDFLEUR_TAT_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GENKI_TAT_MOD%'=='none' (
echo GENKI_TAT_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GENKI_TAT_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\tattoo_original_yinyang\*.* optional_mod_stuff\tmp_workspace\ /y
echo GENKI_TAT_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%SAM_TAT_MOD%'=='none' (
echo SAM_TAT_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%SAM_TAT_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\tatoo_original_saintchest\*.* optional_mod_stuff\tmp_workspace\ /y
echo SAM_TAT_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%WARDROBE_COLOR_MOD%'=='none' (
echo WARDROBE_COLOR_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%WARDROBE_COLOR_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\wardrobe_colors\*.* optional_mod_stuff\tmp_workspace\ /y
echo WARDROBE_COLOR_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_MEDICAL_MOD%'=='none' (
echo GANG_MEDICAL_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_MEDICAL_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_80s_medical_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_MEDICAL_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_MIME_MOD%'=='none' (
echo GANG_MIME_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_MIME_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_80s_mime_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_MIME_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_RONIN_MOD%'=='none' (
echo GANG_RONIN_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_RONIN_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_80s_ronin_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_RONIN_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_BEACH_MOD%'=='none' (
echo GANG_BEACH_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_BEACH_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_80s_beach_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_BEACH_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_EXEC_MOD%'=='none' (
echo GANG_EXEC_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_EXEC_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_80s_exec_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_EXEC_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_LAW_MOD%'=='none' (
echo GANG_LAW_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_LAW_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_bodyguard_law_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_LAW_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_BARBERSHOP_MOD%'=='none' (
echo GANG_BARBERSHOP_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_BARBERSHOP_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_bodyguard_barbershop_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_BARBERSHOP_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_NUCLEAR_MOD%'=='none' (
echo GANG_NUCLEAR_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_NUCLEAR_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_bodyguard_nuclear_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_NUCLEAR_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_COWBOY_MOD%'=='none' (
echo GANG_COWBOY_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_COWBOY_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_bodyguard_cowboy_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_COWBOY_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_STRIPPER_MOD%'=='none' (
echo GANG_STRIPPER_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_STRIPPER_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_bodyguard_stripper_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_STRIPPER_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_CHEERLEADER_MOD%'=='none' (
echo GANG_CHEERLEADER_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_CHEERLEADER_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_gangster_cheerleader_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_CHEERLEADER_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_ELDERLY_MOD%'=='none' (
echo GANG_ELDERLY_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_ELDERLY_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_gangster_elderly_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_ELDERLY_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_GOTH_MOD%'=='none' (
echo GANG_GOTH_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_GOTH_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_gangster_goth_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_GOTH_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_SAMEDI_MOD%'=='none' (
echo GANG_SAMEDI_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_SAMEDI_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_gangster_samedi_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_SAMEDI_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_HIPPIE_MOD%'=='none' (
echo GANG_HIPPIE_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_HIPPIE_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_gangster_hippie_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_HIPPIE_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_BUM_MOD%'=='none' (
echo GANG_BUM_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_BUM_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_ninja_bum_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_BUM_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_CONSTRUCTION_MOD%'=='none' (
echo GANG_CONSTRUCTION_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_CONSTRUCTION_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_ninja_construction_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_CONSTRUCTION_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_SCIENTIST_MOD%'=='none' (
echo GANG_SCIENTIST_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_SCIENTIST_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_ninja_scientist_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_SCIENTIST_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_PRISONER_MOD%'=='none' (
echo GANG_PRISONER_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_PRISONER_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_ninja_prisoner_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_PRISONER_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_FIREFIGHTER_MOD%'=='none' (
echo GANG_FIREFIGHTER_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_FIREFIGHTER_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_ninja_firefighter_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_FIREFIGHTER_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_AIRLINES_MOD%'=='none' (
echo GANG_AIRLINES_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_AIRLINES_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_pimpshos_airlines_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_AIRLINES_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_BROTHERHOOD_MOD%'=='none' (
echo GANG_BROTHERHOOD_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_BROTHERHOOD_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_pimpshos_brotherhood_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_BROTHERHOOD_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_STREAKER_MOD%'=='none' (
echo GANG_STREAKER_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_STREAKER_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_pimpshos_streaker_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_STREAKER_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_JUDGE_MOD%'=='none' (
echo GANG_JUDGE_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_JUDGE_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_pimpshos_judge_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_JUDGE_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_REALPIMP_MOD%'=='none' (
echo GANG_REALPIMP_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_REALPIMP_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_prephop_realpimp_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_REALPIMP_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_ZOMBIE_MOD%'=='none' (
echo GANG_ZOMBIE_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_ZOMBIE_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_prephop_zombie_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_ZOMBIE_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_PUNK_MOD%'=='none' (
echo GANG_PUNK_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_PUNK_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_prephop_punk_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_PUNK_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_BIKER_MOD%'=='none' (
echo GANG_BIKER_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_BIKER_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_sporty_biker_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_BIKER_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_PIRATE_MOD%'=='none' (
echo GANG_PIRATE_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_PIRATE_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_sporty_pirate_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_PIRATE_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_SPORT_MOD%'=='none' (
echo GANG_SPORT_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_SPORT_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_sporty_sport_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_SPORT_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_WEIRDCOP_MOD%'=='none' (
echo GANG_WEIRDCOP_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_WEIRDCOP_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_sporty_weirdcop_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_WEIRDCOP_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_SAILOR_MOD%'=='none' (
echo GANG_SAILOR_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_SAILOR_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_sporty_sailor_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_SAILOR_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_FOOD_MOD%'=='none' (
echo GANG_FOOD_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_FOOD_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_prephop_food_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_FOOD_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_MAIN_SAINTS_MOD%'=='none' (
echo GANG_MAIN_SAINTS_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_MAIN_SAINTS_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_sporty_main_saints_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_MAIN_SAINTS_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_MAIN_BROTHERHOOD_MOD%'=='none' (
echo GANG_MAIN_BROTHERHOOD_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_MAIN_BROTHERHOOD_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_sporty_main_brotherhood_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_MAIN_BROTHERHOOD_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_MAIN_RONIN_MOD%'=='none' (
echo GANG_MAIN_RONIN_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_MAIN_RONIN_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_sporty_main_ronin_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_MAIN_RONIN_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GANG_MAIN_SAMEDI_MOD%'=='none' (
echo GANG_MAIN_SAMEDI_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GANG_MAIN_SAMEDI_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gang_style_sporty_main_samedi_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo GANG_MAIN_SAMEDI_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%RAPIDFIRE_ROCKET_MOD%'=='none' (
echo RAPIDFIRE_ROCKET_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%RAPIDFIRE_ROCKET_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\weapon_rapidfire_rocket_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo RAPIDFIRE_ROCKET_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%SUPER_TORNADO_MOD%'=='none' (
echo SUPER_TORNADO_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%SUPER_TORNADO_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\weapon_super_tornado_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo SUPER_TORNADO_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%SUPER_TORNADO_NONUKE_MOD%'=='none' (
echo SUPER_TORNADO_NONUKE_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%SUPER_TORNADO_NONUKE_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\weapon_super_tornado_nonuke_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo SUPER_TORNADO_NONUKE_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%SATCHEL_NUKE_MOD%'=='none' (
echo SATCHEL_NUKE_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%SATCHEL_NUKE_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\weapon_satchel_nuke_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo SATCHEL_NUKE_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%ALL_WEAPON_MOD%'=='none' (
echo ALL_WEAPON_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%ALL_WEAPON_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\weapon_all_weapon_mod\*.* optional_mod_stuff\tmp_workspace\ /y
echo ALL_WEAPON_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GYRO_ORIGINAL_MOD%'=='none' (
echo GYRO_ORIGINAL_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GYRO_ORIGINAL_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\vehicle_gyrodaddy_original\*.* optional_mod_stuff\tmp_workspace\ /y
echo GYRO_ORIGINAL_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%PAUSE_TCHOUPA_MOD%'=='none' (
echo PAUSE_TCHOUPA_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%PAUSE_TCHOUPA_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\music_pause_tchoupa\*.* optional_mod_stuff\tmp_workspace\ /y
echo PAUSE_TCHOUPA_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%PAUSE_COCONUTS_MOD%'=='none' (
echo PAUSE_COCONUTS_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%PAUSE_COCONUTS_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\music_pause_coconuts\*.* optional_mod_stuff\tmp_workspace\ /y
echo PAUSE_COCONUTS_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%PAUSE_ORIGINAL_MOD%'=='none' (
echo PAUSE_ORIGINAL_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%PAUSE_ORIGINAL_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\music_pause_original\*.* optional_mod_stuff\tmp_workspace\ /y
echo PAUSE_ORIGINAL_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%ALL_MUSIC_ORIGINAL_MOD%'=='none' (
echo ALL_MUSIC_ORIGINAL_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%ALL_MUSIC_ORIGINAL_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\music_all_original\*.* optional_mod_stuff\tmp_workspace\ /y
echo ALL_MUSIC_ORIGINAL_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%FOV_LEFT_MOD%'=='none' (
echo FOV_LEFT_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%FOV_LEFT_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\fov_left\*.* optional_mod_stuff\tmp_workspace\ /y
echo FOV_LEFT_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%FOV_RIGHT_MOD%'=='none' (
echo FOV_RIGHT_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%FOV_RIGHT_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\fov_right\*.* optional_mod_stuff\tmp_workspace\ /y
echo FOV_RIGHT_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%ZOMBIE_UPRISING_FBI_MOD%'=='none' (
echo ZOMBIE_UPRISING_FBI_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%ZOMBIE_UPRISING_FBI_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\zombie_uprising_at_the_mall_fbi\*.* optional_mod_stuff\tmp_workspace\ /y
echo ZOMBIE_UPRISING_FBI_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%ZOMBIE_UPRISING_MAERO_MOD%'=='none' (
echo ZOMBIE_UPRISING_MAERO_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%ZOMBIE_UPRISING_MAERO_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\zombie_uprising_at_the_mall_maero\*.* optional_mod_stuff\tmp_workspace\ /y
echo ZOMBIE_UPRISING_MAERO_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%ZOMBIE_UPRISING_JYUNICHI_MOD%'=='none' (
echo ZOMBIE_UPRISING_JYUNICHI_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%ZOMBIE_UPRISING_JYUNICHI_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\zombie_uprising_at_the_mall_jyunichi\*.* optional_mod_stuff\tmp_workspace\ /y
echo ZOMBIE_UPRISING_JYUNICHI_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%ZOMBIE_UPRISING_WONG_MOD%'=='none' (
echo ZOMBIE_UPRISING_WONG_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%ZOMBIE_UPRISING_WONG_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\zombie_uprising_at_the_mall_wong\*.* optional_mod_stuff\tmp_workspace\ /y
echo ZOMBIE_UPRISING_WONG_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%ZOMBIE_UPRISING_SUNSHINE_MOD%'=='none' (
echo ZOMBIE_UPRISING_SUNSHINE_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%ZOMBIE_UPRISING_SUNSHINE_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\zombie_uprising_at_the_mall_sunshine\*.* optional_mod_stuff\tmp_workspace\ /y
echo ZOMBIE_UPRISING_SUNSHINE_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%ZOMBIE_UPRISING_DANE_MOD%'=='none' (
echo ZOMBIE_UPRISING_DANE_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%ZOMBIE_UPRISING_DANE_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\zombie_uprising_at_the_mall_dane\*.* optional_mod_stuff\tmp_workspace\ /y
echo ZOMBIE_UPRISING_DANE_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%ZOMBIE_UPRISING_PIERCE_MOD%'=='none' (
echo ZOMBIE_UPRISING_PIERCE_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%ZOMBIE_UPRISING_PIERCE_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\zombie_uprising_at_the_mall_pierce\*.* optional_mod_stuff\tmp_workspace\ /y
echo ZOMBIE_UPRISING_PIERCE_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%VILLAIN_PACK_MOD%'=='none' (
echo VILLAIN_PACK_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%VILLAIN_PACK_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\villain_homies\*.* optional_mod_stuff\tmp_workspace\ /y
echo VILLAIN_PACK_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%HOMIES_MISC_MOD%'=='none' (
echo HOMIES_MISC_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%HOMIES_MISC_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\homies_misc\*.* optional_mod_stuff\tmp_workspace\ /y
echo HOMIES_MISC_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%GAT_SUIT_MOD%'=='none' (
echo GAT_SUIT_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%GAT_SUIT_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\gat_suit\*.* optional_mod_stuff\tmp_workspace\ /y
echo GAT_SUIT_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%POSTGAME_GANG_CONTROL_MOD%'=='none' (
echo POSTGAME_GANG_CONTROL_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%POSTGAME_GANG_CONTROL_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\post_game_gang_control\*.* optional_mod_stuff\tmp_workspace\ /y
echo POSTGAME_GANG_CONTROL_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%CD_LOC_MOD%'=='none' (
echo CD_LOC_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%CD_LOC_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\cd_locations_original\*.* optional_mod_stuff\tmp_workspace\ /y
echo CD_LOC_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%CHUNK_SWAP_MOD%'=='none' (
echo CHUNK_SWAP_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%CHUNK_SWAP_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\chunk_swaps\*.* optional_mod_stuff\tmp_workspace\ /y
echo CHUNK_SWAP_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%NEW_CRIBS_MOD%'=='none' (
echo NEW_CRIBS_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%NEW_CRIBS_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\new_cribs\*.* optional_mod_stuff\tmp_workspace\ /y
echo NEW_CRIBS_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%OPEN_CHEAT_MOD%'=='none' (
echo OPEN_CHEAT_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%OPEN_CHEAT_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\open_mod_cheats\*.* optional_mod_stuff\tmp_workspace\ /y
echo OPEN_CHEAT_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%OPEN_PRICING_MOD%'=='none' (
echo OPEN_PRICING_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%OPEN_PRICING_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\open_mod_pricing\*.* optional_mod_stuff\tmp_workspace\ /y
echo OPEN_PRICING_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%OPEN_RESPECT_MOD%'=='none' (
echo OPEN_RESPECT_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%OPEN_RESPECT_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\open_mod_respect\*.* optional_mod_stuff\tmp_workspace\ /y
echo OPEN_RESPECT_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%OPEN_WEAPONS_MOD%'=='none' (
echo OPEN_WEAPONS_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%OPEN_WEAPONS_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\open_mod_weaponsforsale\*.* optional_mod_stuff\tmp_workspace\ /y
echo OPEN_WEAPONS_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%OPEN_NOTORIETY_MOD%'=='none' (
echo OPEN_NOTORIETY_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%OPEN_NOTORIETY_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\open_mod_notoriety\*.* optional_mod_stuff\tmp_workspace\ /y
echo OPEN_NOTORIETY_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%OPEN_ALL_MOD%'=='none' (
echo OPEN_ALL_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%OPEN_ALL_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\open_mod_cheats\*.* optional_mod_stuff\tmp_workspace\ /y
copy optional_mod_stuff\optional_mods\open_mod_pricing\*.* optional_mod_stuff\tmp_workspace\ /y
copy optional_mod_stuff\optional_mods\open_mod_respect\*.* optional_mod_stuff\tmp_workspace\ /y
copy optional_mod_stuff\optional_mods\open_mod_weaponsforsale\*.* optional_mod_stuff\tmp_workspace\ /y
copy optional_mod_stuff\optional_mods\open_mod_notoriety\*.* optional_mod_stuff\tmp_workspace\ /y
echo OPEN_ALL_MOD=installed>> optional_mod_stuff\gotr.ini
)

if '%WEAPON_MJOLNIR_HOMERUN_MOD%'=='none' (
echo WEAPON_MJOLNIR_HOMERUN_MOD=none>> optional_mod_stuff\gotr.ini
)
if '%WEAPON_MJOLNIR_HOMERUN_MOD%'=='installed' (
copy optional_mod_stuff\optional_mods\weapon_mjolnir_homerun\*.* optional_mod_stuff\tmp_workspace\ /y
echo WEAPON_MJOLNIR_HOMERUN_MOD=installed>> optional_mod_stuff\gotr.ini
)



REM Copy any user mods on top of everything else and build patch

echo Copying personal mods
del optional_mod_stuff\1-MODDERS_-_PUT_YOUR_OWN_PERSONAL_MODS_HERE\tmp.txt /Q
copy optional_mod_stuff\1-MODDERS_-_PUT_YOUR_OWN_PERSONAL_MODS_HERE\*.* optional_mod_stuff\tmp_workspace\ /y



echo Building new patch
optional_mod_stuff\tools\Gibbed.SaintsRow2.BuildPackage.exe "MY_CUSTOM_PATCH\patch.vpp_pc" "optional_mod_stuff\tmp_workspace" "optional_mod_stuff\original_patch"
del optional_mod_stuff\tmp_workspace\*.* /Q




REM copy standard preloads over

copy optional_mod_stuff\preload.tbl "MY_CUSTOM_PATCH" /y
copy optional_mod_stuff\preload_anim.tbl "MY_CUSTOM_PATCH" /y


GOTO END


:VANILLA

echo Deleting existing patch files
del MY_CUSTOM_PATCH\*.* /Q

echo Copying multi-language support files
copy optional_mod_stuff\modified\*.le_strings optional_mod_stuff\tmp_workspace\ /y

echo Building vanilla patch
optional_mod_stuff\tools\Gibbed.SaintsRow2.BuildPackage.exe "MY_CUSTOM_PATCH\patch.vpp_pc" "optional_mod_stuff\tmp_workspace" "optional_mod_stuff\original_patch"
del optional_mod_stuff\tmp_workspace\*.* /Q

echo copying vanilla preloads
copy optional_mod_stuff\optional_mods\vanilla_preloads\*.* "MY_CUSTOM_PATCH" /y

GOTO END


:END
cls
echo.
echo FUCK YEAH! BUILD COMPLETE!
echo.
echo Thank you for flying Gentlemen of the Row airlines.
echo.
echo You will find your shiny new custom patch file and preloads in the
echo MY_CUSTOM_PATCH folder.
echo.
echo Simply replace the files in your SR2 install directory with your new
echo custom ones.
echo.
echo Remember that if you're not spending every moment in SR2 doing retarded crazy
echo shit, then you're doing it wrong! - The Gents
echo.
echo http://idolninja.com
echo.
pause

:OOPS