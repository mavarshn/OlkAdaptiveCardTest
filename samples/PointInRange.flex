<FlexUI>

	<DataSource ID="ProgressData">
		<Property ID="Position" Type="Int32"/>
		<Property ID="Position2" Type="Int32"/>
		<Property ID="CommitEvent" Type="Event"/>
	</DataSource>


	<FlexML>

		<DialogView DataSourceType="ProgressData">

			<PointInRange ID="PointInRange" Value="*Bind(Property=Position)" CommitCommand="*Bind(Property=CommitEvent)"/>
			<ShowInformation Label="Position: " Value="*Bind(Source=PointInRange; Property=Value)"/>
			<ShowInformation Label="Position (via DS): " Value="*Bind(Property=Position)"/>
			<PointInRange ID="PointInRange2" Minimum="20" Maximum="80" Value="*Bind(Property=Position2)"/>
			<ShowInformation Label="Position: " Value="*Bind(Source=PointInRange2; Property=Value)"/>

		</DialogView>

	</FlexML>

	<ProgressData>
	</ProgressData>

</FlexUI>
