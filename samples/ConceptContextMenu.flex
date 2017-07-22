<FlexUI>

<FlexML>
	<DialogView DataSourceType="TestRoot">
		<Category Class="Grouping">
			<ExecuteAction Label="*Bind(Property=Label)" ContextMenu="*Bind(Property=MR)" />
		</Category>
	</DialogView>
</FlexML>

<DataSource ID="MG" BasedOn="NetUI::MenuGroupDS"/>
<DataSource ID="MC" BasedOn="NetUI::MenuCommandDS"/>
<DataSource ID="MF" BasedOn="NetUI::MenuFlyoutDS"/>
<DataSource ID="MR" BasedOn="NetUI::MenuRootDS"/>

<DataSource ID="TestNode">
	<Property ID="Label" Type="String" />
</DataSource>

<DataSource ID="TestRoot">
	<Property ID="MR" Type="MR"/>
	<Property ID="Label" Type="String" />
	<Property ID="TestNode" Type="TestNode" />
</DataSource>

<TestRoot>
	<Label>TestRoot Label</Label>
	<TestNode><Label>TestNode Label</Label></TestNode>
	<MR>
		<Groups>
			<MG>
				<Label>Cool Things</Label>
				<Items>
					<MC>
						<Label>Monkeys</Label>
					</MC>
					<MC>
						<Label>Ninjas</Label>
					</MC>
					<MF>
						<Label>Pirates</Label>
						<Items>
							<MG>
								<Items>
									<MC>
										<Label>Blackbeard</Label>
									</MC>
									<MC>
										<Label>Black Bart</Label>
									</MC>
									<MC>
										<Label>The Swamp Fox</Label>
									</MC>
								</Items>
							</MG>
							<MG>
								<Items>
									<MC>
										<Label>Jack Sparrow</Label>
									</MC>
									<MC>
										<Label>Miles Baxter</Label>
									</MC>
								</Items>
							</MG>
						</Items>
					</MF>
				</Items>
			</MG>
			<MG>
				<Label>Uncool Things</Label>
				<Items>
					<MF>
						<Label>Boy Bands</Label>
						<Items>
							<MG>
								<Items>
									<MC>
										<Label>Backstreet Boys</Label>
									</MC>
									<MC>
										<Label>New Kids on the Block</Label>
									</MC>
								</Items>
							</MG>
						</Items>
					</MF>
					<MC>
						<Label>Duck Tours</Label>
					</MC>
					<MC>
						<Label>Wicker</Label>
					</MC>
				</Items>
			</MG>

		</Groups>
	</MR>
</TestRoot>

</FlexUI>