return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			test = 'what an amazingly delicious burger, amirite?'
		}
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
		consume = 0,
		client = {
			anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' },
			disable = { move = true, car = true, combat = true },
			usetime = 5000,
			cancel = true
		}
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 and GetResourceState('npwd') == 'started' then
					exports.npwd:setPhoneDisabled(false)
				end
			end,

			remove = function(total)
				if total < 1 and GetResourceState('npwd') == 'started' then
					exports.npwd:setPhoneDisabled(true)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		consume = 0,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 3500
		}
	},

	['beer'] = {
		label = 'beer',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['bread'] = {
		label = 'bread',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['medikit'] = {
		label = 'medikit',
		weight = 2,
		stack = true,
		close = true,
		description = ''
	},

	['alive_chicken'] = {
		label = 'poulet vivant',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['blowpipe'] = {
		label = 'chalumeaux',
		weight = 2,
		stack = true,
		close = true,
		description = ''
	},

	['carokit'] = {
		label = 'kit carosserie',
		weight = 3,
		stack = true,
		close = true,
		description = ''
	},

	['carotool'] = {
		label = 'outils carosserie',
		weight = 2,
		stack = true,
		close = true,
		description = ''
	},

	['clothe'] = {
		label = 'vêtement',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['copper'] = {
		label = 'cuivre',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['cutted_wood'] = {
		label = 'bois coupé',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['diamond'] = {
		label = 'diamant',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['essence'] = {
		label = 'essence',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['fabric'] = {
		label = 'tissu',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['fish'] = {
		label = 'poisson',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['fixkit'] = {
		label = 'kit réparation',
		weight = 3,
		stack = true,
		close = true,
		description = ''
	},

	['fixtool'] = {
		label = 'outils réparation',
		weight = 2,
		stack = true,
		close = true,
		description = ''
	},

	['gazbottle'] = {
		label = 'bouteille de gaz',
		weight = 2,
		stack = true,
		close = true,
		description = ''
	},

	['gold'] = {
		label = 'or',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['iron'] = {
		label = 'fer',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['packaged_chicken'] = {
		label = 'poulet en barquette',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['packaged_plank'] = {
		label = 'paquet de planches',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['petrol'] = {
		label = 'pétrole',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['petrol_raffin'] = {
		label = 'pétrole raffiné',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['slaughtered_chicken'] = {
		label = 'poulet abattu',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['stone'] = {
		label = 'pierre',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['washed_stone'] = {
		label = 'pierre lavée',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['wood'] = {
		label = 'bois',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},

	['wool'] = {
		label = 'laine',
		weight = 1,
		stack = true,
		close = true,
		description = ''
	},
}