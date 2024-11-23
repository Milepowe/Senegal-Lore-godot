extends Polygon2D
	
func _draw() -> void:
	var outline_points = polygon
	outline_points.append(polygon[0])
	draw_polyline(outline_points, Color(0.062, 0.23, 0.118, 1), 1.5)
