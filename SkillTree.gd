func _on_save():
	var nodes = []

	for i in range(self.get_child_count()):
		recursive_node_traversal_no_attrib(self.get_child(i), nodes)
		
	var dict = {}
	var index = 0
	
	dict["BtnNodes"] = {}
	
	for i in range(0, len(nodes)):
		var subDict = {
			"label_text" : nodes[i].label.text,
			"line2d_color" : nodes[i].line_2d.default_color,
			"panel" : nodes[i].panel.show_behind_parent
		}
		dict["BtnNodes"][i] = subDict
		
	for i in range(0, len(nodes)):
		print(dict["BtnNodes"][i])
		
	SaveManager.save_file(dict, "BtnNodes")
		
func _on_load():
	var data: Dictionary = SaveManager.load_file("BtnNodes")
	
	var nodes = []

	for i in range(self.get_child_count()):
		recursive_node_traversal_no_attrib(self.get_child(i), nodes)
	
	allocated_points = 0
		
	for i in range(0, len(nodes)):
		if int(data["BtnNodes"][str(i)]["label_text"].split("/")[0]) >= 1:
			allocated_points += int(data["BtnNodes"][str(i)]["label_text"].split("/")[0])
			var skills = nodes[i].get_children()
			for s in skills:
				if s is SkillNode:
					s.disabled = false
			nodes[i].disabled = false
			
		nodes[i].level = int(data["BtnNodes"][str(i)]["label_text"].split("/")[0])
		nodes[i].label.text = data["BtnNodes"][str(i)]["label_text"]
		nodes[i].panel.show_behind_parent = data["BtnNodes"][str(i)]["panel"]
		var splitted_color_data = data["BtnNodes"][str(i)]["line2d_color"].split("(")[1].split(",")
		nodes[i].line_2d.default_color = Color(float(splitted_color_data[0]), float(splitted_color_data[1]), float(splitted_color_data[2]))

			
	available_points -= allocated_points
func recursive_node_traversal_no_attrib(node, visited_nodes):
	if node is SkillNode:
		if node in visited_nodes:
			return
		else:
			visited_nodes.append(node)
			
		if node.get_child_count() > 0:
			for i in range(node.get_child_count()):
				recursive_node_traversal_no_attrib(node.get_child(i), visited_nodes)
		
func recursive_node_traversal(node, visited_nodes, attrib):
	if node is SkillNode:
		if node in visited_nodes:
			return
		else:
			visited_nodes.append(node[attrib])
			
		if node.get_child_count() > 0:
			for i in range(node.get_child_count()):
				recursive_node_traversal(node.get_child(i), visited_nodes, attrib)
				


