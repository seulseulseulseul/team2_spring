<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
// ratingToPercent() {
// //     const score = +this.restaurant.averageScore * 20;
// 	const score = 3* 20;;
//     return score + 1.5;
// }
</script>
<style type="text/css">
.star-ratings {
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
}
 
.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="star-ratings">
	<div 
    class="star-ratings-fill space-x-2 text-lg"
     style="{ width: 50 + '%' }"
	>
<!--     :style="{ width: ratingToPercent + '%' }" -->
		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	</div>
	<div class="star-ratings-base space-x-2 text-lg">
		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	</div>
</div>
</body>
</html>