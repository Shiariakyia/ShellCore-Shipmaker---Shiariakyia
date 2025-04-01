/// @description Insert description here
// You can write your code in this editor
//image_xscale *= 4.5; 
//image_speed = 0;

global.windowBoxes = [];
global.isGrabbed = false;
global.MusicFiles = [];
global.MusicEnabled = true;
global.SoundEnabled = true;

red = make_color_rgb(255, 0, 0);
green = make_color_rgb(0, 255, 0);
blue = make_color_rgb(0, 128, 255);
cyan = make_color_rgb(0, 255, 255);
grey = make_color_rgb(128,128,128);
yellow = make_color_rgb(255, 255, 0);
jadegreen =  make_color_rgb(0, 255, 128);
white = make_color_rgb(255,255,255);

btnShipmaker = instance_create_depth(room_width / 2 - 125, room_height / 2 - 20, 0, o_button);
btnShipmaker.image_xscale *= 5; //the main place where we will make custom shellcores obeying the rules of original or remastered SCC design choices, or just freely create what we like
btnShipmaker.buttonText = "SHELLCORE EDITOR";
btnShipmaker.hoverText = "CREATE YOUR SHELLCORE DESIGNS HERE";
btnShipmaker.hoverTextColor = green;

btnUnitEditor = instance_create_depth(room_width / 2 + 125, room_height / 2 - 20, 0, o_button);
btnUnitEditor.image_xscale *= 5; //this is where custom turret and tanks can be mounted with any weapon, there's a plan of making them having multiple weapons as well
btnUnitEditor.buttonText = "UNIT EDITOR";
btnUnitEditor.hoverText = "CREATE ANYTHING THAT DOES NOT INVOLVES SHIP PARTS";
btnUnitEditor.hoverTextColor = green;

btnComicEditor = instance_create_depth(room_width / 2, room_height / 2 - 20, 0, o_button);
btnComicEditor.image_xscale *= 5; //this is where peoples will make comics importing .sccsm, .sccue files
btnComicEditor.buttonText = "COMIC EDITOR";
btnComicEditor.hoverText = "THE COMIC CREATION ASSISTANCE MODULE";
btnComicEditor.hoverTextColor = grey;
btnComicEditor.matrixColor = [0.0, 1.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0]//white
		 
btnOptions = instance_create_depth(room_width / 2 - 62.5, room_height / 2 + 60, 0, o_button);
btnOptions.image_xscale *= 5; //control graphic related options, sounds, musics, volumes
btnOptions.buttonText = "OPTIONS";
btnOptions.hoverText = "TOGGLE VISUAL OPTIONS, SOUNDS, MUSICS AND HOW LOUD THEY ARE";
btnOptions.hoverTextColor = blue;
btnOptions.matrixColor = [1.0, 0.0, 0.0, 0.0,
		 0.45, 0.5, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0]//blue

btnSettings = instance_create_depth(room_width / 2 + 62.5, room_height / 2 + 60, 0, o_button);
btnSettings.image_xscale *= 5; //in charge of changing game resolution, fullscreen mode as well reassigning hotkeys
btnSettings.buttonText = "SETTINGS";
btnSettings.hoverText = "CHANGE PROGRAM RESOLUTION SIZE, FULLSCREEN TOGGLE, REASSIGN HOTKEYS";
btnSettings.hoverTextColor = cyan;
btnSettings.matrixColor = [1.0, 0.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0]//cyan
		 
btnAlmanac = instance_create_depth(room_width / 2 + 125, room_height / 2 + 20, 0, o_button);
btnAlmanac.image_xscale *= 5;
btnAlmanac.buttonText = "ALMANAC";
btnAlmanac.hoverText = "VIEW THE DETAILS AND THE DESCRIPTION OF EACH RACES";
btnAlmanac.hoverTextColor = jadegreen;
btnAlmanac.matrixColor = [1.0, 0.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.45, 0.5, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0]//jadegreen
		 
btnLibrary = instance_create_depth(room_width / 2, room_height / 2 + 20, 0, o_button);
btnLibrary.image_xscale *= 5;
btnLibrary.buttonText = "LIBRARY";
btnLibrary.hoverText = "ACCESS THE LIST OF COMIC MAKING ASSETS";
btnLibrary.hoverTextColor = white;
btnLibrary.matrixColor = [0.0, 1.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0]//
		 
btnCatalog = instance_create_depth(room_width / 2 - 125, room_height / 2 + 20, 0, o_button);
btnCatalog.image_xscale *= 5;
btnCatalog.buttonText = "CATALOGUE";
btnCatalog.hoverText = "VIEW THE DETAILS OF PART TYPES AND CORE TYPES WITHIN LIST";
btnCatalog.hoverTextColor = jadegreen;
btnCatalog.matrixColor = [1.0, 0.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.45, 0.5, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0]//jadegreen

btnExit = instance_create_depth(room_width / 2, room_height / 2 + 100, 0, o_button);
btnExit.image_xscale *= 5; //exit the game
btnExit.buttonText = "CLOSE PROGRAM";
btnExit.hoverText = "YOU ARE DONE ALREADY?";
btnExit.hoverTextColor = red;
btnExit.matrixColor = [0.0, 1.0, 0.0, 0.0,
		 1.0, 0.0, 0.0, 0.0,
		 1.0, 0.0, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0]//red