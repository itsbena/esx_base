return {
	{
		coords = vec3(452.3, -991.4, 30.7),
		target = {
			loc = vec3(451.25, -994.28, 30.69),
			length = 1.2,
			width = 5.6,
			heading = 0,
			minZ = 29.49,
			maxZ = 32.09,
			label = 'Open personal locker'
		},
		name = 'policelocker',
		label = 'Police locker',
		owner = false,
		slots = 150,
		weight = 500000,
		groups = shared.police
	},

	{
		coords = vec3(303.76, -600.5, 43.28),
		target = {
			loc = vec3(303.76, -600.5, 43.28),
			length = 0.6,
			width = 1.8,
			heading = 340,
			minZ = 43.34,
			maxZ = 44.74,
			label = 'Open personal locker'
		},
		name = 'emslocker',
		label = 'EMS locker',
		owner = false,
		slots = 150,
		weight = 500000,
		groups = {['ambulance'] = 0}
	},
}
