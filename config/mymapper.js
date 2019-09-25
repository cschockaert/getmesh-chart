function extractGroups(principle) {
	var groups = [];
	if (principle.resource_access && principle.resource_access.getmesh && Array.isArray(principle.resource_access.getmesh.roles)) {
		for (var i = 0; i < principle.resource_access.getmesh.roles.length; i++) {
			groups.push(principle.resource_access.getmesh.roles[i])
		}
	}
	return groups;
}

function extractRoles(principle) {
	var roles = [];
	return [];
}
