<cfloop array="#prc.listing#" index="news">
	<cfoutput>
		<a href="news/show?id=#news.getid()#">
			<h1>#news.getTitle()# <span>by #news.getUsername()#</span> <span>on #dateFormat(news.getdatePublished(), 'dd/mm/yyyy')#</span></h1>
		</a>
	</cfoutput>
</cfloop>