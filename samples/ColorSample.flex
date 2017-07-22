<FlexUI>

	<DataSource ID="Root">
		<Property ID="ColorProp" Type="Color" />
	</DataSource>

	<FlexML>
		<element 
			layoutChildren="vertical" background="*Bind(Property=ColorProp)"
			expandToFillHoriz="true" expandToFillVert="true"
		>
			<DialogView>
				<PickColor Label="Choose a background color:"  Value="*Bind(Property=ColorProp)" />
			</DialogView>		
		</element>
	</FlexML>


	<Root />

</FlexUI>
