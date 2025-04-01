// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function partsData(){
	
	function RemasteredCoreStat(_coreId, _shell, _core, _energy, _regshell, _regcore, _regenergy, _intendedType) constructor {
		coreID = _coreId;
		shellHealth = [_shell, _core, _energy];
		baseRegen = [_regshell, _regcore, _regenergy];
		intendedType = _intendedType;
	}
	
	global.RM_CoreStats = [
		new RemasteredCoreStat("drone_shell", 1000, 250, 500, 60, 0, 60, 7),
		new RemasteredCoreStat("core1_shell", 1000, 250, 500, 60, 0, 30, 0),
		new RemasteredCoreStat("core2_shell", 1000, 250, 500, 90, 0, 45, 0),
		new RemasteredCoreStat("core3skills_shell", 1000, 250, 500, 120, 0, 60, 0),
		new RemasteredCoreStat("core3weapons_shell", 1000, 250, 500, 120, 0, 60, 0),
		new RemasteredCoreStat("core4commando_shell", 1000, 250, 500, 150, 0, 75, 0),
		new RemasteredCoreStat("core4elite_shell", 1000, 250, 500, 150, 0, 75, 0),
		new RemasteredCoreStat("core4captain_shell", 1000, 250, 500, 150, 0, 75, 0),
		new RemasteredCoreStat("core4admiral_shell", 1000, 250, 500, 150, 0, 75, 0),
	];
	
    function Core(_name, _size, coreStringID) constructor {
		nameCore = _name;
		sizeCore = _size;
		coreString = coreStringID;
		remasteredStat = undefined;
		
		for(var i = 0; i < array_length(global.RM_CoreStats); i++){
			var stat = global.RM_CoreStats[i];
			
			if (stat.coreID == nameCore){
				remasteredStat = stat;
				break;
			}
		}
	}
	
	function Part(_name, _size, partStringID, flippable) constructor {
		namePart = _name; //to assist with importing part configuration data from the game's json itself
		sizePart = _size; //part size
		partString= partStringID; //for local ID Identification within the ship maker
		flip = flippable; //can be flipped?
	}
	
	function RelocCore(oldID, StringID) constructor{
		ID = oldID;
		String = StringID;
		ReturnCoreData = noone;
		for(var i = 0; i < array_length(global.core); i++){
			for	(var j = 0; j < array_length(global.core[i]); j++){
				var CoreSample = global.core[i][j];
				if (CoreSample.coreString == String) {
					ReturnCoreData = CoreSample;
					break;
				}
				if (ReturnCoreData != noone) break;
			}
		}
	}
	
	function RelocPart(oldID, StringID) constructor{
		ID = oldID;
		String = StringID;
		ReturnPartData = noone;
		for(var i = 0; i < array_length(global.part); i++){
			for	(var j = 0; j < array_length(global.part[i]); j++){
				var PartSample = global.part[i][j];
				if (PartSample.partString == String) {
					ReturnPartData = PartSample;
					break;
				}
			}
			if (ReturnPartData != noone) break;
		}
	}
	
	function Attribute(_icon, _hasLevel, _id, _name, _attrIndex, _index, _type, _desc) constructor {
		hasLevel = _hasLevel;
		abilityId = is_array(_id) ? _id[0] : _id;//for assistance verifying the imported JSON AbilityID from the remaster if they're available
		secondaryData = is_array(_id) ? _id[1] : noone;
		nameAttr = _name;
		attributeIndex = _attrIndex
		indexAttr = _index;
		if(hasLevel == false) levelAttr=undefined;
		else levelAttr = 1;
		Description = _desc;
		attrType = _type;
		attrStats = [];
		iconIndex = undefined;
		switch(attrType){
			case "Weapon":
			iconIndex = s_Weapons;
			break;
			case "Spawn":
			iconIndex = s_Drones;
			break;
			case "Ability":
			iconIndex = s_Passives;
			break;
			case "Passive":
			iconIndex = s_Passives;
			break;
			default:
			iconIndex = noone;
			break;
		}
		iconImgIndex = _icon;
	}
	
	function WeaponStat(_name, _damage, _range, _firerate, _energycost){

	}
	
	function AbilityStat(){
		
	}
	
	function SpawnStat(){
		
	}
	
	function PassiveStat(){
		
	}
	
	//"A classic anti-Station weapon, which were based from something that was really time old. It were used widely by the Verdant Confederation cores, some other races might still uses an older kind of it till these day, but its not as much as it used to, they just had to use it due to some lack of resources to produce their own weapons. (Partially compatible with some other existing races, just have less drawbacks when being used by them)."
	//"A classic anti-Drone weaponry, this were based off and derived upon an ancient counterpart of itself. It is based on the shooter weaponry of the first shellcorean race, and was been redesigned from its own original primitive counterparts after aeons of uses and improvements."
	//"The classic iconic anti-Shellcore weapon. It was remaded after the Lightshiner of the ancestral first Shellcorean race. This kind of weapon were now used widely by the current Shellcore races to kill each other, which was not the original purpose of the Lightshiner were supposed to do."
	//"This is the classic Missile weapon, which was based upon something that was called the Thunderorb of the ancient cores… It was not a perfect recreation of the ancient weapon, as it was slower, but still have enough power to deal heavy damage."
	//"The Torpedo weapon were used to counteract ground to air warfare, as well destroying the ground structures… It has an ancient counterpart of it, that was originally used to destroy threats in lower elevation of shellcorean spaces, back when there was no ground platform existed."
	//""
	//"A weapon which is designed to interrupts drone spawns and charging up skills. It deal very little damage physically but can reduce the enemy of its available energy reserves."
	//"This weapon is designed to deal extra damage to the core and penetrates through a few layer of shell parts, it deal low damage but has a rapid fire, can targets both Ground and Air unit by their own. It has a previous predecessor called the Gun weapon, which was a hitscan weapon like the Cannon, however such weapon can only target Ground unit and was designed to only deal extra damage to Tanks."
	
	global.attributeWeap = [
		[//verdant green weapons
			new Attribute(noone, false, 0, "", s_wpn_verdantGreen, 0, "", ""),
			new Attribute(0, true, 5, "Bullet", s_wpn_verdantGreen, 1, "Weapon", "A classic anti-Station weapon, which were based from something that was really time old. It were used widely by the Verdant Confederation cores, some other races might still uses an older kind of it till these day, but its not as much as it used to, they just had to use it due to some lack of resources to produce their own weapons. (Partially compatible with some other existing races, just have less drawbacks when being used by them)."),
			new Attribute(1, true, 6, "Cannon", s_wpn_verdantGreen, 2, "Weapon", "A classic anti-Drone weaponry, this were based off and derived upon an ancient counterpart of itself. It is based on the shooter weaponry of the first shellcorean race, and was been redesigned from its own original primitive counterparts after aeons of uses and improvements."),
			new Attribute(2, true, 4, "Beam", s_wpn_verdantGreen, 3, "Weapon", ""),
			new Attribute(4, true, 7, "Missile", s_wpn_verdantGreen, 4, "Weapon", ""),
			new Attribute(5, true, 8, "Torpedo", s_wpn_verdantGreen, 5, "Weapon", "The Torpedo weapon were used to counteract ground to air warfare, as well destroying the ground structures… It has an ancient counterpart of it, that was originally used to destroy threats in lower elevation of shellcorean spaces, back when there was no ground platform existed."),
			new Attribute(5, true, 36, "Bomb", s_wpn_verdantGreen, 9, "Weapon", ""),
			new Attribute(3, true, 33, "Disrupt", s_wpn_verdantGreen, 7, "Weapon", "A weapon which is designed to interrupts drone spawns and charging up skills. It deal very little damage physically but can reduce the enemy of its available energy reserves."),
			new Attribute(2, true, 9, "Laser", s_wpn_verdantGreen, 6, "Weapon", "This weapon is designed to deal extra damage to the core and penetrates through a few layer of shell parts, it deal low damage but has a rapid fire, can targets both Ground and Air unit by their own. It has a previous predecessor called the Gun weapon, which was a hitscan weapon like the Cannon, however such weapon can only target Ground unit and was designed to only deal extra damage to Tanks."),
			new Attribute(0, true, 38, "Flak", s_wpn_verdantGreen, 12, "Weapon", ""),
			new Attribute(2, true, noone, "MRLS", s_wpn_verdantGreen, 10, "Weapon", ""),
			new Attribute(1, true, noone, "Gun", s_wpn_verdantGreen, 8, "Weapon", ""),
			new Attribute(2, true, 37, "ION", s_wpn_verdantGreen, 11, "Weapon", ""),
		],
		[//defect yellow weapons
			new Attribute(noone, false, 0, "", s_wpn_defectsYellow, 0, "", ""),
			new Attribute(noone, true, noone, "Pelter", s_wpn_defectsYellow, 1, "Weapon", ""),
			new Attribute(noone, true, noone, "Flaerg", s_wpn_defectsYellow, 2, "Weapon", ""),
			new Attribute(noone, true, noone, "Blaster", s_wpn_defectsYellow, 3, "Weapon", ""),
			new Attribute(noone, true, noone, "", s_wpn_defectsYellow, 4, "Weapon", ""),
			new Attribute(noone, true, noone, "", s_wpn_defectsYellow, 5, "Weapon", ""),
			new Attribute(noone, true, noone, "", s_wpn_defectsYellow, 6, "Weapon", ""),
			new Attribute(noone, true, noone, "", s_wpn_defectsYellow, 7, "Weapon", ""),
			new Attribute(noone, true, noone, "", s_wpn_defectsYellow, 8, "Weapon", ""),
		],
		[//coreling blue weapons
			new Attribute(noone, false, 0, "", s_wpn_corelingBlue, 0, "", ""),
			new Attribute(noone, true, noone, "", s_wpn_corelingBlue, 1, "Weapon", ""),
			new Attribute(noone, true, noone, "", s_wpn_corelingBlue, 2, "Weapon", ""),
			new Attribute(noone, true, noone, "", s_wpn_corelingBlue, 3, "Weapon", ""),
			new Attribute(noone, true, noone, "", s_wpn_corelingBlue, 4, "Weapon", ""),
			new Attribute(noone, true, noone, "", s_wpn_corelingBlue, 5, "Weapon", ""),
			new Attribute(noone, true, noone, "", s_wpn_corelingBlue, 6, "Weapon", ""),
			new Attribute(noone, true, noone, "", s_wpn_corelingBlue, 7, "Weapon", ""),
			new Attribute(noone, true, noone, "", s_wpn_corelingBlue, 8, "Weapon", ""),
		],
	];
	
	global.attributeAbil = [
		[
			new Attribute(noone, false, 0, "", s_ability, 0, "", ""),
			new Attribute(noone, true, 2, "Shell Boost", s_ability, 1, "Ability", ""),
			new Attribute(noone, true, 1, "Speed Thrust", s_ability, 1, "Ability", ""),
			new Attribute(noone, true, 30, "Regen", s_ability, 1, "Ability", ""),
			new Attribute(noone, true, 11, "Core Heal", s_ability, 2, "Ability", ""),
			new Attribute(noone, true, 25, "Damage Boost", s_ability, 4, "Ability", ""),
			new Attribute(noone, true, 32, "Energy Boost", s_ability, 3, "Ability", ""),
			new Attribute(noone, true, 27, "Pin Down", s_ability, 1, "Ability", ""),
			new Attribute(noone, false, 28, "Retreat", s_ability, 8, "Ability", ""),
			new Attribute(noone, false, 24, "Stealth", s_ability, 1, "Ability", ""),
		]
	];
	
	global.attributeSpwn = [
		[
			new Attribute(noone, false, 0, "", s_ability, 0, "", ""),
			new Attribute(0, false, [10, "worker_drone"], "Worker Drone", s_ability, 1, "Spawn", ""),
			new Attribute(1, false, [10, "mini_drone"], "Mini Drone", s_ability, 1, "Spawn", ""),
			new Attribute(3, false, [10, "light_drone"], "Light Drone", s_ability, 1, "Spawn", ""),
			new Attribute(3, false, [10, "strike_drone"], "Strike Drone", s_ability, 1, "Spawn", ""),
			new Attribute(3, false, [10, "gun_drone"], "Gun Drone", s_ability, 1, "Spawn", ""),
			new Attribute(4, false, [10, "counter_drone"], "Counter Drone", s_ability, 1, "Spawn", ""),
			new Attribute(5, false, [10, "heavy_drone"], "Heavy Drone", s_ability, 1, "Spawn", ""),
			new Attribute(2, false, noone, "Bomber Drone", s_ability, 1, "Spawn", ""),
			new Attribute(2, false, [10, "torpedo_drone"], "Torpedo Drone", s_ability, 1, "Spawn", ""),
			new Attribute(5, false, noone, "Missile Drone", s_ability, 1, "Spawn", ""),
		]
	];
	
	global.attributePass = [
		[
			new Attribute(noone, false, 0, "", s_ability, 0, "", ""),
			new Attribute(5, true, 13, "Speed", s_ability, 0, "Passive", ""),
			new Attribute(5, true, 13, "Accel", s_ability, 0, "Passive", ""),
			new Attribute(2, true, 17, "Shell Regen", s_ability, 0, "Passive", ""),
			new Attribute(4, true, 19, "Energy Regen", s_ability, 0, "Passive", ""),
			new Attribute(2, true, 18, "Shell Max", s_ability, 0, "Passive", ""),
			new Attribute(4, true, 20, "Energy Max", s_ability, 0, "Passive", ""),
			new Attribute(9, true, 21, "Command", s_ability, 0, "Passive", ""),
			new Attribute(9, false, 34, "Control", s_ability, 0, "Passive", ""),
		]
	];
	
	global.core = [//Verdant cores data
				   [new Core("groundcarriershell", 3, "Verd.C.B1"), //each element inside 'i' array is defined by 'j'
					new Core("drone_shell", 1, "Verd.C.D1"),
					new Core("semicore_shell", 1, "Verd.C.D2"),
					new Core("", 1, "Verd.C.D3"),
					new Core("core1_shell", 1, "Verd.C.N"),
					new Core("", 1, "Verd.C.S1"),
					new Core("", 1, "Verd.C.S2"),
					new Core("core2_shell", 2, "Verd.C.M1"),
					new Core("", 2, "Verd.C.M2"),
					new Core("core3weapons_shell", 3, "Verd.C.L1"),
					new Core(["core3skills_shell", "core3_shell"], 3, "Verd.C.L2"), //Caution: there are 2 different sprite IDs for this core in RM
					new Core("", 3, "Verd.C.SP1"),
					new Core("", 3, "Verd.C.SP2"),
					new Core("", 2, "Verd.C.ST"),
					new Core("", 1, "Verd.C.B2"),
					new Core("", 1, "Verd.C.B3")], //each element arrays inside 'core' array defines by 'i' or 'coreArr'
				//Defect cores data
					[new Core("", 3, "Reff.C.B1"), //each element inside 'i' array is defined by 'j'
					new Core("", 1, "Reff.C.D1"),
					new Core("", 1, "Reff.C.D2"),
					new Core("", 1, "Reff.C.D3"),
					new Core("", 1, "Reff.C.N"),
					new Core("", 1, "Reff.C.S1"),
					new Core("", 1, "Reff.C.S2"),
					new Core("", 2, "Reff.C.M1"),
					new Core("", 2, "Reff.C.M2"),
					new Core("", 3, "Reff.C.L1"),
					new Core("", 3, "Reff.C.L2"),
					new Core("", 3, "Reff.C.SP1"),
					new Core("", 3, "Reff.C.SP2"),
					new Core("", 2, "Reff.C.ST"),
					new Core("", 1, "Reff.C.B2"),
					new Core("", 1, "Reff.C.B3")], //each element arrays inside 'core' array defines by 'i' or 'coreArr'
				//Coreling Native cores
					[new Core("", 3, "Core.C.B1"), //each element inside 'i' array is defined by 'j'
					new Core("", 1, "Core.C.D1"),
					new Core("", 1, "Core.C.D2"),
					new Core("", 1, "Core.C.D3"),
					new Core("", 1, "Core.C.N"),
					new Core("", 1, "Core.C.S1"),
					new Core("", 1, "Core.C.S2"),
					new Core("", 2, "Core.C.M1"),
					new Core("", 2, "Core.C.M2"),
					new Core("", 3, "Core.C.L1"),
					new Core("", 3, "Core.C.L2"),
					new Core("", 3, "Core.C.SP1"),
					new Core("", 3, "Core.C.SP2"),
					new Core("", 2, "Core.C.ST"),
					new Core("", 1, "Core.C.B2"),
					new Core("", 1, "Core.C.B3")], //each element arrays inside 'core' array defines by 'i' or 'coreArr'
				//Coreling Chrono cores
					[new Core("", 3, "Chro.C.B1"), //each element inside 'i' array is defined by 'j'
					new Core("", 1, "Chro.C.D1"),
					new Core("", 1, "Chro.C.D2"),
					new Core("", 1, "Chro.C.D3"),
					new Core("", 1, "Chro.C.N"),
					new Core("", 1, "Chro.C.S1"),
					new Core("", 1, "Chro.C.S2"),
					new Core("", 2, "Chro.C.M1"),
					new Core("", 2, "Chro.C.M2"),
					new Core("", 3, "Chro.C.L1"),
					new Core("", 3, "Chro.C.L2"),
					new Core("", 3, "Chro.C.SP1"),
					new Core("", 3, "Chro.C.SP2"),
					new Core("", 2, "Chro.C.ST"),
					new Core("", 1, "Chro.C.B2"),
					new Core("", 1, "Chro.C.B3")], //each element arrays inside 'core' array defines by 'i' or 'coreArr'
				//Scavenger cores data
					[new Core("", 3, "Scav.C.B1"), //each element inside 'i' array is defined by 'j'
					new Core("", 1, "Scav.C.D1"),
					new Core("", 1, "Scav.C.D2"),
					new Core("", 1, "Scav.C.D3"),
					new Core("", 1, "Scav.C.N"),
					new Core("", 1, "Scav.C.S1"),
					new Core("", 1, "Scav.C.S2"),
					new Core("", 2, "Scav.C.M1"),
					new Core("", 2, "Scav.C.M2"),
					new Core("", 3, "Scav.C.L1"),
					new Core("", 3, "Scav.C.L2"),
					new Core("", 3, "Scav.C.SP1"),
					new Core("", 3, "Scav.C.SP2"),
					new Core("", 2, "Scav.C.ST"),
					new Core("", 1, "Scav.C.B2"),
					new Core("", 1, "Scav.C.B3")], //each element arrays inside 'core' array defines by 'i' or 'coreArr'
					];
	//Hint: coreSizes[coreArr][core_index]
	//[coreName, size, coreStringID]
	global.part = [
				   [new Part("SmallWing2", 1, "Verd.P.S1", true),
					new Part("SmallWing3", 1, "Verd.P.S2", true),
					new Part("SmallWing1", 1, "Verd.P.S3", true),
					new Part("SmallSide4", 1, "Verd.P.S4", true),
					new Part("SmallSide3", 1, "Verd.P.S5", true),
					new Part("SmallSide1", 1, "Verd.P.S6", true),
					new Part("SmallCenter9", 1, "Verd.P.S7", false),
					new Part("SmallSide2", 1, "Verd.P.S8", false),
					new Part("SmallCenter6", 1, "Verd.P.S9", false),
					new Part("SmallCenter3", 1, "Verd.P.S10", false),
					new Part("SmallCenter2", 1, "Verd.P.S11", false),
					new Part("SmallCenter1", 1, "Verd.P.S12", false),
					new Part("SmallCenter5", 1, "Verd.P.S13", false),
					new Part("SmallCenter4", 1, "Verd.P.S14", false),
					new Part("SmallCenter7", 1, "Verd.P.S15", false),
					new Part("SmallCenter8", 1, "Verd.P.S16", false),
					new Part("", 1, "Verd.P.S17", true),
					new Part("MediumWing3", 2, "Verd.P.M1", true),
					new Part("MediumWing2", 2, "Verd.P.M2", true),
					new Part("MediumWing1", 2, "Verd.P.M3", true),
					new Part("MediumSide4", 2, "Verd.P.M4", true),
					new Part("", 2, "Verd.P.M5", false),
					new Part("", 2, "Verd.P.M6", false),
					new Part("MediumSide2", 2, "Verd.P.M7", true),
					new Part("MediumSide1", 2, "Verd.P.M8", true),
					new Part("MediumExtra2", 2, "Verd.P.M9", true),
					new Part("MediumExtra1", 2, "Verd.P.M10", false),
					new Part("MediumCenter6", 2, "Verd.P.M11", false),
					new Part("MediumSide3", 2, "Verd.P.M12", true),
					new Part("MediumCenter5", 2, "Verd.P.M13", false),
					new Part("MediumCenter3", 2, "Verd.P.M14", false),
					new Part("MediumCenter2", 2, "Verd.P.M15", false),
					new Part("MediumCenter1", 2, "Verd.P.M16", false),
					new Part("MediumCenter4", 2, "Verd.P.M17", false),
					//new Part("MediumWing4", 2, "Verd.P.M18", false),
					new Part("BigWing5", 3, "Verd.P.L1", true),
					new Part("BigWing3", 3, "Verd.P.L2", true),
					new Part("BigWing4", 3, "Verd.P.L3", true),
					new Part("BigWing1", 3, "Verd.P.L4", true),
					new Part("BigSide6", 3, "Verd.P.L5", true),
					new Part("BigSide5", 3, "Verd.P.L6", true),
					new Part("BigWing2", 3, "Verd.P.L7", true),
					new Part("BigSide4", 3, "Verd.P.L8", true),
					new Part("BigSide1", 3, "Verd.P.L9", true),
					new Part("BigCenter3", 3, "Verd.P.L10", false),
					new Part("BigCenter2", 3, "Verd.P.L11", false),
					new Part("BigSide2", 3, "Verd.P.L12", true),
					new Part("BigCenter1", 3, "Verd.P.L13", false),
					new Part("BigSide3", 3, "Verd.P.L14", true),
				   ],
				   
				   [new Part("", 1, "Reff.P.S1", true),
				   new Part("", 1, "Reff.P.S2", true),
				   new Part("", 1, "Reff.P.S3", true),
				   new Part("", 1, "Reff.P.S4", true),
				   new Part("", 1, "Reff.P.S5", true),
				   new Part("", 1, "Reff.P.S6", true),
				   new Part("", 1, "Reff.P.S7", true),
				   new Part("", 1, "Reff.P.S8", true),
				   new Part("", 1, "Reff.P.S9", true),
				   new Part("", 1, "Reff.P.S10", true),
				   new Part("", 1, "Reff.P.S11", true),
				   new Part("", 1, "Reff.P.S12", true),
				   new Part("", 1, "Reff.P.S13", true),
				   new Part("", 1, "Reff.P.S14", true),
				   new Part("", 1, "Reff.P.S15", true),
				   new Part("", 1, "Reff.P.S16", true),
				   new Part("", 1, "Reff.P.S17", true),
				   new Part("", 1, "Reff.P.S18", true),
				   new Part("", 1, "Reff.P.S19", true),
				   new Part("", 2, "Reff.P.M1", true),
				   new Part("", 2, "Reff.P.M2", true),
				   new Part("", 2, "Reff.P.M3", true),
				   new Part("", 2, "Reff.P.M4", true),
				   new Part("", 2, "Reff.P.M5", true),
				   new Part("", 2, "Reff.P.M6", true),
				   new Part("", 2, "Reff.P.M7", true),
				   new Part("", 2, "Reff.P.M8", true),
				   new Part("", 2, "Reff.P.M9", true),
				   new Part("", 2, "Reff.P.M10", true),
				   new Part("", 2, "Reff.P.M11", true),
				   new Part("", 2, "Reff.P.M12", true),
				   new Part("", 2, "Reff.P.M13", true),
				   new Part("", 3, "Reff.P.L1", true),
				   new Part("", 3, "Reff.P.L2", true),
				   new Part("", 3, "Reff.P.L3", true),
				   new Part("", 3, "Reff.P.L4", true),
				   new Part("", 3, "Reff.P.L5", true),
				   new Part("", 3, "Reff.P.L6", true),
				   new Part("", 3, "Reff.P.L7", true),
				   new Part("", 3, "Reff.P.L8", true),
				   new Part("", 3, "Reff.P.L9", true),
				   new Part("", 3, "Reff.P.L10", true)
				   ],
				   
				   [new Part("", 1, "Core.P.S1", true),
				   new Part("", 1, "Core.P.S2", true),
				   new Part("", 1, "Core.P.S3", true),
				   new Part("", 1, "Core.P.S4", true),
				   new Part("", 1, "Core.P.S5", true),
				   new Part("", 1, "Core.P.S6", true),
				   new Part("", 1, "Core.P.S7", true),
				   new Part("", 1, "Core.P.S8", true),
				   new Part("", 1, "Core.P.S9", true),
				   new Part("", 1, "Core.P.S10", true),
				   new Part("", 1, "Core.P.S11", true),
				   new Part("", 1, "Core.P.S12", true),
				   new Part("", 1, "Core.P.S13", true),
				   new Part("", 1, "Core.P.S14", true),
				   new Part("", 1, "Core.P.S15", true),
				   new Part("", 1, "Core.P.S16", true),
				   new Part("", 1, "Core.P.S17", true),
				   new Part("", 1, "Core.P.S18", true),
				   new Part("", 1, "Core.P.S19", true),
				   new Part("", 1, "Core.P.S20", true),
				   new Part("", 2, "Core.P.M1", true),
				   new Part("", 2, "Core.P.M2", true),
				   new Part("", 2, "Core.P.M3", true),
				   new Part("", 2, "Core.P.M4", true),
				   new Part("", 2, "Core.P.M5", true),
				   new Part("", 2, "Core.P.M6", true),
				   new Part("", 2, "Core.P.M7", true),
				   new Part("", 2, "Core.P.M8", true),
				   new Part("", 2, "Core.P.M9", true),
				   new Part("", 2, "Core.P.M10", true),
				   new Part("", 2, "Core.P.M11", true),
				   new Part("", 2, "Core.P.M12", true),
				   new Part("", 2, "Core.P.M13", true),
				   new Part("", 3, "Core.P.L1", true),
				   new Part("", 3, "Core.P.L2", true),
				   new Part("", 3, "Core.P.L3", true),
				   new Part("", 3, "Core.P.L4", true),
				   new Part("", 3, "Core.P.L5", true)
				   ]
					];
	//Hint: partSizes[partArr][part_index]
	//[partIDName, sprIndexID, size]
					
	global.WeaponStat = []
	
	global.AbilityStat = []
	
	global.PassiveStat = []
	
	global.SpawnStat = []

	global.OldPartData = [
		[new RelocPart(0, "Verd.P.S1"),
		new RelocPart(1, "Verd.P.S2"),
		new RelocPart(2, "Verd.P.S3"),
		new RelocPart(3, "Verd.P.S4"),
		new RelocPart(4, "Verd.P.S5"),
		new RelocPart(5, "Verd.P.S6"),
		new RelocPart(6, "Verd.P.S7"),
		new RelocPart(7, "Verd.P.S8"),
		new RelocPart(8, "Verd.P.S9"),
		new RelocPart(9, "Verd.P.S10"),
		new RelocPart(10, "Verd.P.S11"),
		new RelocPart(11, "Verd.P.S12"),
		new RelocPart(12, "Verd.P.S13"),
		new RelocPart(13, "Verd.P.S14"),
		new RelocPart(14, "Verd.P.S15"),
		new RelocPart(15, "Verd.P.S16"),
		new RelocPart(16, "Verd.P.S17"),
		new RelocPart(17, "Verd.P.M1"),
		new RelocPart(18, "Verd.P.M2"),
		new RelocPart(19, "Verd.P.M3"),
		new RelocPart(20, "Verd.P.M4"),
		new RelocPart(21, "Verd.P.M5"),
		new RelocPart(22, "Verd.P.M6"),
		new RelocPart(23, "Verd.P.M7"),
		new RelocPart(24, "Verd.P.M8"),
		new RelocPart(25, "Verd.P.M9"),
		new RelocPart(26, "Verd.P.M10"),
		new RelocPart(27, "Verd.P.M11"),
		new RelocPart(28, "Verd.P.M12"),
		new RelocPart(29, "Verd.P.M13"),
		new RelocPart(30, "Verd.P.M14"),
		new RelocPart(31, "Verd.P.M15"),
		new RelocPart(32, "Verd.P.M16"),
		new RelocPart(33, "Verd.P.M17"),
		new RelocPart(34, "Verd.P.L1"),
		new RelocPart(35, "Verd.P.L2"),
		new RelocPart(36, "Verd.P.L3"),
		new RelocPart(37, "Verd.P.L4"),
		new RelocPart(38, "Verd.P.L5"),
		new RelocPart(39, "Verd.P.L6"),
		new RelocPart(40, "Verd.P.L7"),
		new RelocPart(41, "Verd.P.L8"),
		new RelocPart(42, "Verd.P.L9"),
		new RelocPart(43, "Verd.P.L10"),
		new RelocPart(44, "Verd.P.L11"),
		new RelocPart(45, "Verd.P.L12"),
		new RelocPart(46, "Verd.P.L13"),
		new RelocPart(47, "Verd.P.L14")],
		
		[new RelocPart(0, "Reff.P.S1"),
		new RelocPart(1, "Reff.P.S2"),
		new RelocPart(2, "Reff.P.S3"),
		new RelocPart(3, "Reff.P.S4"),
		new RelocPart(4, "Reff.P.S5"),
		new RelocPart(5, "Reff.P.S6"),
		new RelocPart(6, "Reff.P.S7"),
		new RelocPart(7, "Reff.P.S8"),
		new RelocPart(8, "Reff.P.S9"),
		new RelocPart(9, "Reff.P.S10"),
		new RelocPart(10, "Reff.P.S11"),
		new RelocPart(11, "Reff.P.S12"),
		new RelocPart(12, "Reff.P.S13"),
		new RelocPart(13, "Reff.P.S14"),
		new RelocPart(14, "Reff.P.S15"),
		new RelocPart(15, "Reff.P.S16"),
		new RelocPart(16, "Reff.P.S17"),
		new RelocPart(17, "Reff.P.S18"),
		new RelocPart(18, "Reff.P.S19"),
		new RelocPart(19, "Reff.P.M1"),
		new RelocPart(20, "Reff.P.M2"),
		new RelocPart(21, "Reff.P.M3"),
		new RelocPart(22, "Reff.P.M4"),
		new RelocPart(23, "Reff.P.M5"),
		new RelocPart(24, "Reff.P.M6"),
		new RelocPart(25, "Reff.P.M7"),
		new RelocPart(26, "Reff.P.M8"),
		new RelocPart(27, "Reff.P.M9"),
		new RelocPart(28, "Reff.P.M10"),
		new RelocPart(29, "Reff.P.M11"),
		new RelocPart(30, "Reff.P.M12"),
		new RelocPart(31, "Reff.P.M13"),
		new RelocPart(32, "Reff.P.L1"),
		new RelocPart(33, "Reff.P.L2"),
		new RelocPart(34, "Reff.P.L3"),
		new RelocPart(35, "Reff.P.L4"),
		new RelocPart(36, "Reff.P.L5"),
		new RelocPart(37, "Reff.P.L6"),
		new RelocPart(38, "Reff.P.L7"),
		new RelocPart(39, "Reff.P.L8"),
		new RelocPart(40, "Reff.P.L9"),
		new RelocPart(41, "Reff.P.L10")],
		
		[new RelocPart(0, "Core.P.S1"),
		new RelocPart(1, "Core.P.S2"),
		new RelocPart(2, "Core.P.S3"),
		new RelocPart(3, "Core.P.S4"),
		new RelocPart(4, "Core.P.S5"),
		new RelocPart(5, "Core.P.S6"),
		new RelocPart(6, "Core.P.S7"),
		new RelocPart(7, "Core.P.S8"),
		new RelocPart(8, "Core.P.S9"),
		new RelocPart(9, "Core.P.S10"),
		new RelocPart(10, "Core.P.S11"),
		new RelocPart(11, "Core.P.S12"),
		new RelocPart(12, "Core.P.S13"),
		new RelocPart(13, "Core.P.S14"),
		new RelocPart(14, "Core.P.S15"),
		new RelocPart(15, "Core.P.S16"),
		new RelocPart(16, "Core.P.S17"),
		new RelocPart(17, "Core.P.S18"),
		new RelocPart(18, "Core.P.S19"),
		new RelocPart(19, "Core.P.S20"),
		new RelocPart(20, "Core.P.M1"),
		new RelocPart(21, "Core.P.M2"),
		new RelocPart(22, "Core.P.M3"),
		new RelocPart(23, "Core.P.M4"),
		new RelocPart(24, "Core.P.M5"),
		new RelocPart(25, "Core.P.M6"),
		new RelocPart(26, "Core.P.M7"),
		new RelocPart(27, "Core.P.M8"),
		new RelocPart(28, "Core.P.M9"),
		new RelocPart(29, "Core.P.M10"),
		new RelocPart(30, "Core.P.M11"),
		new RelocPart(31, "Core.P.M12"),
		new RelocPart(32, "Core.P.M13"),
		new RelocPart(33, "Core.P.L1"),
		new RelocPart(34, "Core.P.L2"),
		new RelocPart(35, "Core.P.L3"),
		new RelocPart(36, "Core.P.L4"),
		new RelocPart(37, "Core.P.L5")]
	];
	
	global.OldCoreData = [
		[new RelocCore(0, "Verd.C.B1"), //each element inside 'i' array is defined by 'j'
		new RelocCore(1, "Verd.C.D1"),
		new RelocCore(2, "Verd.C.D2"),
		new RelocCore(3, "Verd.C.D3"),
		new RelocCore(4, "Verd.C.N"),
		new RelocCore(5, "Verd.C.S1"),
		new RelocCore(6, "Verd.C.S2"),
		new RelocCore(7, "Verd.C.M1"),
		new RelocCore(8, "Verd.C.M2"),
		new RelocCore(9, "Verd.C.L1"),
		new RelocCore(10, "Verd.C.L2"),
		new RelocCore(11, "Verd.C.SP1"),
		new RelocCore(12, "Verd.C.SP2"),
		new RelocCore(13, "Verd.C.ST"),
		new RelocCore(14, "Verd.C.B2"),
		new RelocCore(15, "Verd.C.B3")], //each element arrays inside 'core' array defines by 'i' or 'coreArr'
		//Defect cores data
		[new RelocCore(0, "Reff.C.B1"), //each element inside 'i' array is defined by 'j'
		new RelocCore(1, "Reff.C.D1"),
		new RelocCore(2, "Reff.C.D2"),
		new RelocCore(3, "Reff.C.D3"),
		new RelocCore(4, "Reff.C.N"),
		new RelocCore(5, "Reff.C.S1"),
		new RelocCore(6, "Reff.C.S2"),
		new RelocCore(7, "Reff.C.M1"),
		new RelocCore(8, "Reff.C.M2"),
		new RelocCore(9, "Reff.C.L1"),
		new RelocCore(10, "Reff.C.L2"),
		new RelocCore(11, "Reff.C.SP1"),
		new RelocCore(12, "Reff.C.SP2"),
		new RelocCore(13, "Reff.C.ST"),
		new RelocCore(14, "Reff.C.B2"),
		new RelocCore(15, "Reff.C.B3")], //each element arrays inside 'core' array defines by 'i' or 'coreArr'
		//Coreling Native cores
		[new RelocCore(0, "Core.C.B1"), //each element inside 'i' array is defined by 'j'
		new RelocCore(1, "Core.C.D1"),
		new RelocCore(2, "Core.C.D2"),
		new RelocCore(3, "Core.C.D3"),
		new RelocCore(4, "Core.C.N"),
		new RelocCore(5, "Core.C.S1"),
		new RelocCore(6, "Core.C.S2"),
		new RelocCore(7, "Core.C.M1"),
		new RelocCore(8, "Core.C.M2"),
		new RelocCore(9, "Core.C.L1"),
		new RelocCore(10, "Core.C.L2"),
		new RelocCore(11, "Core.C.SP1"),
		new RelocCore(12, "Core.C.SP2"),
		new RelocCore(13, "Core.C.ST"),
		new RelocCore(14, "Core.C.B2"),
		new RelocCore(15, "Core.C.B3")], //each element arrays inside 'core' array defines by 'i' or 'coreArr'
	];
	
	/* Intended Types
		0 - ShellCore,
        1 - PlayerCore,
        2 - Turret,
        3 - Tank,
        4 - Bunker,
        5 - Outpost,
        6 - Tower,
        7 - Drone,
        8 - AirCarrier,
        9 - GroundCarrier,
        10 - Yard,
        11 - WeaponStation,
        12 - Trader,
        13 - CoreUpgrader,
        14 - DroneWorkshop,
        15 - AirWeaponStation,
        16 - TowerBase
	*/
	
	
}