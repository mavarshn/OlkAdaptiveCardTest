<FlexUI>
	<DataSource ID="DialogData">
		<Property ID="Items" Type="List"/>
	</DataSource>

	<DataSource ID="SIData">
		<Property ID="Label" Type="String"/>
		<Property ID="SIValue" Type="Int"/>
		<Property ID="OtherDSString" Type="String"/>
	</DataSource>

	<FlexML>
		<DialogView DataSourceType="DialogData">
			<SelectSingleItem ShowOnlySelected="true" ID="SSI" Label="Which Place?">
				<List Items="*Bind(Property=Items; BindType=OneWay)">
					<ItemTemplate ForType="SIData">
						<SelectionItem Label="*Bind(Property=Label; BindType=OneWay)" SelectionValue="*Bind(Property=SIValue; BindType=OneWay)"/>
					</ItemTemplate>
				</List>
			</SelectSingleItem>

			<ShowInformation Label="SelectedIndex:" Value="*Bind(Property=SelectedIndex; Source=SSI; BindType=OneWay)" />
			<ShowInformation Label="SelectedItem.Label:" Value="*Bind(Property=SelectedItem.Label; Source=SSI; BindType=OneWay)" />
			<ShowInformation Label="SOSSelectedItem.Label:" Value="*Bind(Property=SOSSelectedItem.Label; Source=SSI; BindType=OneWay)" />
			<ShowInformation Label="TelemetryId:" Value="*Bind(Property=Telemetry; BindType=OneWay)" />
			<ShowInformation Label="Selected Value:" Value="*Bind(Property=SelectedValue; Source=SSI; BindType=OneWay)" />
			<ShowInformation Label="Selected Other string:" Value="*Bind(Property=SelectedItem.OtherDSString; Source=SSI; BindType=OneWay)" />

			<EnterInteger Label="Selected Value:" Value="*Bind(Property=SelectedValue; Source=SSI; BindType=TwoWay)" />

			
		</DialogView>
	</FlexML>

	<DialogData>
		<Items>
			<SIData>
				<Label>SID: First</Label>
				<SIValue>111</SIValue>
				<OtherDSString>Other: for first item</OtherDSString>
			</SIData>
			<SIData>
				<Label>SID: Second</Label>
				<SIValue>222</SIValue>
				<OtherDSString>Other: for second item</OtherDSString>
			</SIData>
			<SIData>
				<Label>SID: Third</Label>
				<SIValue>333</SIValue>
				<OtherDSString>Other: for third item</OtherDSString>
			</SIData>
			<SIData>
				<Label>SID: Four</Label>
				<SIValue>444</SIValue>
				<OtherDSString>Other: for four item</OtherDSString>
			</SIData>
		</Items>
	</DialogData>

</FlexUI>
