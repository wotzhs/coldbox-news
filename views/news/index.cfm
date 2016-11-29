<cfoutput>
<h1>news.index</h1>
<h1>Welcome #session.name#</h1>

<p><a href="news/new">Publish a news!</a></p>
<br>
<div class="news">
	<cfloop array="#prc.listing#" index="news">
		<cfoutput>
			<a href="news/show?id=#news.getid()#">
				<h1>#news.getTitle()# <span>by #news.getUsername()#</span> <span>on #dateFormat(news.getdatePublished(), 'dd/mm/yyyy')#</span></h1>
			</a>
		</cfoutput>
	</cfloop>
	</div>
</cfoutput>
<br>
<button id="load">Load More News</button>

<script type="text/javascript">

	var offset = 0; 

	$('#load').click(function(){
		offset += 5;
		$.ajax({
			url: '/news/load',
			method: 'get',
			data: {offset: offset},
			success: function(data){
				$('.news').append(data);
			},
			fail: function(data){
				console.log(data);
			}
		})
	})
</script>