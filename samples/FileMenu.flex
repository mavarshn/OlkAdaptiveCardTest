<FlexUI>
	<DataSource ID="MyFSFileMenuAnchor" BasedOn="OfficeSpace::FSFileMenuAnchor"/>
	<DataSource ID="MyFSFlyoutAnchor" BasedOn="OfficeSpace::FSFlyoutAnchor"/>
	<DataSource ID="MyFSMenuCategory" BasedOn="OfficeSpace::FSMenuCategory"/>
	<DataSource ID="MyFSExecuteAction" BasedOn="OfficeSpace::FSExecuteAction"/>
	<DataSource ID="MyFSExecuteThisOrOtherAction" BasedOn="OfficeSpace::FSExecuteThisOrOtherAction"/>

	<DataSource ID="MenuDS">
		<Property ID="TailContext" Type="MyFSFileMenuAnchor"/>
	</DataSource>

	<FlexML>

		<OfficeSpaceView DataSourceType="*Any">
			<Category ID="Ribbon" IsSelected="true">
				<FileMenuArea>
					<FlyoutAnchor Class="FileMenuAnchor"
						Tcid="*Bind(Property=Tcid; BindType=OneWay)"
						TemporaryPropertyForState="*Bind(Property=Items; BindType=OneWay)"
						Label="*Bind(Property=Label; BindType=OneWay)"
						ImageSource="*Bind(Property=ImageSource; BindType=OneWay)"
						Tooltip="*Bind(Property=Tooltip; BindType=OneWay)"
						FlexMLContentID="FileMenu"
						IsFlyoutDropped="*Bind(Property=IsFlyoutDropped; BindType=TwoWay)"
						FlyoutOpeningCommand="*Bind(Event=OnFlyoutOpening)"
						FlyoutClosingCommand="*Bind(Event=OnFlyoutClosing)"
						FlyoutItems="*Bind(Property=Items; BindType=OneWay)"
					/>
				</FileMenuArea>
			</Category>
		</OfficeSpaceView>

	</FlexML>

		<MyFSFileMenuAnchor>
			<Label>File</Label>
			<IsVisible>true</IsVisible>
			<Enabled>true</Enabled>
			<Items>
				<MyFSMenuCategory>
					<Class>MajorItems</Class>
					<Items>
						<MyFSExecuteAction>
							<Label>&amp;New</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>true</Enabled>
						</MyFSExecuteAction>
						<MyFSExecuteAction>
							<Label>&amp;Open</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>true</Enabled>
						</MyFSExecuteAction>
						<MyFSExecuteAction>
							<Label>&amp;Save</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>true</Enabled>
						</MyFSExecuteAction>
						<MyFSExecuteThisOrOtherAction>
							<Label>Save As Other Fo&amp;rmat</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>true</Enabled>
							<ButtonItems>
								<MyFSExecuteAction>
									<Label>Save &amp;As...</Label>
									<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
									<IsVisible>true</IsVisible>
									<Enabled>true</Enabled>
								</MyFSExecuteAction>
							</ButtonItems>
							<Items>
								<MyFSMenuCategory>
									<Class>MajorItems</Class>
									<Label>Save As Other Fo&amp;rmat</Label>
									<Items>
										<MyFSExecuteAction>
											<Label>Word 97-2003 Format</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
										<MyFSExecuteAction>
											<Label>Publish as PDF or XPS...</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
										<MyFSExecuteAction>
											<Label>Document Management Server</Label>
											<Description>(Two-line descriptions need MSO.)</Description>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
									</Items>
								</MyFSMenuCategory>
							</Items>
						</MyFSExecuteThisOrOtherAction>
					</Items>
				</MyFSMenuCategory>
				<MyFSMenuCategory>
					<Class>MajorItems</Class>
					<Items>
						<MyFSFlyoutAnchor>
							<Label>&amp;Finalize</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>true</Enabled>
							<Items>
								<MyFSMenuCategory>
									<Class>MajorItems</Class>
									<Label>Before You Share</Label>
									<Items>
										<MyFSExecuteAction>
											<Label>&amp;Inspect Document...</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
										<MyFSExecuteAction>
											<Label>Restrict &amp;Permission</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
									</Items>
								</MyFSMenuCategory>
							</Items>
						</MyFSFlyoutAnchor>
						<MyFSExecuteThisOrOtherAction>
							<Label>Other Ways to S&amp;hare</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>true</Enabled>
							<ButtonItems>
								<MyFSExecuteAction>
									<Label>Sen&amp;d...</Label>
									<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
									<IsVisible>true</IsVisible>
									<Enabled>true</Enabled>
								</MyFSExecuteAction>
							</ButtonItems>
							<Items>
								<MyFSMenuCategory>
									<Class>MajorItems</Class>
									<Label>Other Ways to S&amp;hare</Label>
									<Items>
										<MyFSExecuteAction>
											<Label>Internet Fa&amp;x...</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
										<MyFSExecuteAction>
											<Label>Create &amp;Document Workspace...</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
									</Items>
								</MyFSMenuCategory>
							</Items>
						</MyFSExecuteThisOrOtherAction>
						<MyFSExecuteThisOrOtherAction>
							<Label>Prin&amp;ting Your Document</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>true</Enabled>
							<ButtonItems>
								<MyFSExecuteAction>
									<Label>&amp;Print (d)...</Label>
									<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
									<IsVisible>true</IsVisible>
									<Enabled>false</Enabled>
								</MyFSExecuteAction>
							</ButtonItems>
							<Items>
								<MyFSMenuCategory>
									<Class>MajorItems</Class>
									<Label>Prin&amp;ting Your Document</Label>
									<Items>
										<MyFSExecuteAction>
											<Label>&amp;Quick Print</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
										<MyFSExecuteAction>
											<Label>Print Pre&amp;view</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
									</Items>
								</MyFSMenuCategory>
							</Items>
						</MyFSExecuteThisOrOtherAction>
						<MyFSExecuteThisOrOtherAction>
							<Label>Prin&amp;ting Your Document</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>false</Enabled>
							<ButtonItems>
								<MyFSExecuteAction>
									<Label>&amp;Print (sub-disabled)...</Label>
									<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
									<IsVisible>true</IsVisible>
									<Enabled>true</Enabled>
								</MyFSExecuteAction>
							</ButtonItems>
							<Items>
								<MyFSMenuCategory>
									<Class>MajorItems</Class>
									<Label>Prin&amp;ting Your Document</Label>
									<Items>
										<MyFSExecuteAction>
											<Label>&amp;Quick Print</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
										<MyFSExecuteAction>
											<Label>Print Pre&amp;view</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
									</Items>
								</MyFSMenuCategory>
							</Items>
						</MyFSExecuteThisOrOtherAction>
					</Items>
				</MyFSMenuCategory>
				<MyFSMenuCategory>
					<Class>MajorItems</Class>
					<Items>
						<MyFSExecuteAction>
							<Label>&amp;Close</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>true</Enabled>
						</MyFSExecuteAction>
					</Items>
				</MyFSMenuCategory>
				<MyFSMenuCategory>
					<Class>MajorItems</Class>
					<Items>
						<MyFSFlyoutAnchor>
							<Label>Debug Options</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>false</Enabled>
							<Items>
								<MyFSMenuCategory>
									<Class>MajorItems</Class>
									<Label>Before You Share</Label>
									<Items>
										<MyFSExecuteAction>
											<Label>Options 1</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
									</Items>
								</MyFSMenuCategory>
							</Items>
						</MyFSFlyoutAnchor>
						<MyFSExecuteAction>
							<Label>Random Other: 1</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>true</Enabled>
						</MyFSExecuteAction>
						<MyFSExecuteThisOrOtherAction>
							<Label>Prin&amp;ting Your Document</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>false</Enabled>
							<ButtonItems>
								<MyFSExecuteAction>
									<Label>&amp;Both Disabled</Label>
									<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
									<IsVisible>true</IsVisible>
									<Enabled>false</Enabled>
								</MyFSExecuteAction>
							</ButtonItems>
							<Items>
								<MyFSMenuCategory>
									<Class>MajorItems</Class>
									<Label>Prin&amp;ting Your Document</Label>
									<Items>
										<MyFSExecuteAction>
											<Label>&amp;Quick Print</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
										<MyFSExecuteAction>
											<Label>Print Pre&amp;view</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
									</Items>
								</MyFSMenuCategory>
							</Items>
						</MyFSExecuteThisOrOtherAction>
						<MyFSExecuteAction>
							<Label>Random Other: 2</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>true</Enabled>
						</MyFSExecuteAction>
						<MyFSExecuteAction>
							<Label>Disabled Item</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>false</Enabled>
						</MyFSExecuteAction>

						<!-- **************************** Test of small items ******************************* -->
						<MyFSFlyoutAnchor>
							<Label>Small Items</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>true</Enabled>
							<Items>
								<MyFSMenuCategory>
									<Class>StandardItems</Class>
									<Label>Small Items</Label>
									<Items>
										<MyFSFlyoutAnchor>
											<Label>Regular Flyout</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
											<Items>
												<MyFSMenuCategory>
													<Class>StandardItems</Class>
													<Label>Prin&amp;ting Your Document</Label>
													<Items>
														<MyFSExecuteAction>
															<Label>Print Pre&amp;view</Label>
															<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
															<IsVisible>true</IsVisible>
															<Enabled>true</Enabled>
														</MyFSExecuteAction>
													</Items>
												</MyFSMenuCategory>
											</Items>
										</MyFSFlyoutAnchor>
										<MyFSExecuteThisOrOtherAction>
											<Label>Other Ways to S&amp;hare</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
											<ButtonItems>
												<MyFSExecuteAction>
													<Label>Sen&amp;d...</Label>
													<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
													<IsVisible>true</IsVisible>
													<Enabled>true</Enabled>
												</MyFSExecuteAction>
											</ButtonItems>
											<Items>
												<MyFSMenuCategory>
													<Class>MajorItems</Class>
													<Label>Other Ways to S&amp;hare</Label>
													<Items>
														<MyFSExecuteAction>
															<Label>Internet Fa&amp;x...</Label>
															<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
															<IsVisible>true</IsVisible>
															<Enabled>true</Enabled>
														</MyFSExecuteAction>
														<MyFSExecuteAction>
															<Label>Create &amp;Document Workspace...</Label>
															<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
															<IsVisible>true</IsVisible>
															<Enabled>true</Enabled>
														</MyFSExecuteAction>
													</Items>
												</MyFSMenuCategory>
											</Items>
										</MyFSExecuteThisOrOtherAction>
										<MyFSExecuteThisOrOtherAction>
											<Label>Prin&amp;ting Your Document</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
											<ButtonItems>
												<MyFSExecuteAction>
													<Label>&amp;Print (d)...</Label>
													<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
													<IsVisible>true</IsVisible>
													<Enabled>false</Enabled>
												</MyFSExecuteAction>
											</ButtonItems>
											<Items>
												<MyFSMenuCategory>
													<Class>MajorItems</Class>
													<Label>Prin&amp;ting Your Document</Label>
													<Items>
														<MyFSExecuteAction>
															<Label>&amp;Quick Print</Label>
															<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
															<IsVisible>true</IsVisible>
															<Enabled>true</Enabled>
														</MyFSExecuteAction>
														<MyFSExecuteAction>
															<Label>Print Pre&amp;view</Label>
															<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
															<IsVisible>true</IsVisible>
															<Enabled>true</Enabled>
														</MyFSExecuteAction>
													</Items>
												</MyFSMenuCategory>
											</Items>
										</MyFSExecuteThisOrOtherAction>
										<MyFSExecuteThisOrOtherAction>
											<Label>Prin&amp;ting Your Document</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>false</Enabled>
											<ButtonItems>
												<MyFSExecuteAction>
													<Label>&amp;Print (sub-disabled)...</Label>
													<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
													<IsVisible>true</IsVisible>
													<Enabled>true</Enabled>
												</MyFSExecuteAction>
											</ButtonItems>
											<Items>
												<MyFSMenuCategory>
													<Class>MajorItems</Class>
													<Label>Prin&amp;ting Your Document</Label>
													<Items>
														<MyFSExecuteAction>
															<Label>&amp;Quick Print</Label>
															<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
															<IsVisible>true</IsVisible>
															<Enabled>true</Enabled>
														</MyFSExecuteAction>
														<MyFSExecuteAction>
															<Label>Print Pre&amp;view</Label>
															<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
															<IsVisible>true</IsVisible>
															<Enabled>true</Enabled>
														</MyFSExecuteAction>
													</Items>
												</MyFSMenuCategory>
											</Items>
										</MyFSExecuteThisOrOtherAction>
										<MyFSExecuteThisOrOtherAction>
											<Label>Prin&amp;ting Your Document</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>false</Enabled>
											<ButtonItems>
												<MyFSExecuteAction>
													<Label>&amp;Both Disabled</Label>
													<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
													<IsVisible>true</IsVisible>
													<Enabled>false</Enabled>
												</MyFSExecuteAction>
											</ButtonItems>
											<Items>
												<MyFSMenuCategory>
													<Class>MajorItems</Class>
													<Label>Prin&amp;ting Your Document</Label>
													<Items>
														<MyFSExecuteAction>
															<Label>&amp;Quick Print</Label>
															<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
															<IsVisible>true</IsVisible>
															<Enabled>true</Enabled>
														</MyFSExecuteAction>
														<MyFSExecuteAction>
															<Label>Print Pre&amp;view</Label>
															<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
															<IsVisible>true</IsVisible>
															<Enabled>true</Enabled>
														</MyFSExecuteAction>
													</Items>
												</MyFSMenuCategory>
											</Items>
										</MyFSExecuteThisOrOtherAction>
										<MyFSFlyoutAnchor>
											<Label>Regular Flyout</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
											<Items>
												<MyFSMenuCategory>
													<Class>StandardItems</Class>
													<Label>Prin&amp;ting Your Document</Label>
													<Items>
														<MyFSExecuteAction>
															<Label>Print Pre&amp;view</Label>
															<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
															<IsVisible>true</IsVisible>
															<Enabled>true</Enabled>
														</MyFSExecuteAction>
													</Items>
												</MyFSMenuCategory>
											</Items>
										</MyFSFlyoutAnchor>
										<MyFSFlyoutAnchor>
											<Label>Disabled Flyout</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>false</Enabled>
											<Items>
												<MyFSMenuCategory>
													<Class>StandardItems</Class>
													<Label>Prin&amp;ting Your Document</Label>
													<Items>
														<MyFSExecuteAction>
															<Label>Print Pre&amp;view</Label>
															<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
															<IsVisible>true</IsVisible>
															<Enabled>true</Enabled>
														</MyFSExecuteAction>
													</Items>
												</MyFSMenuCategory>
											</Items>
										</MyFSFlyoutAnchor>
										<MyFSExecuteAction>
											<Label>Enabled Btn Item</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>true</Enabled>
										</MyFSExecuteAction>
										<MyFSExecuteAction>
											<Label>Disabled Btn Item</Label>
											<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
											<IsVisible>true</IsVisible>
											<Enabled>false</Enabled>
										</MyFSExecuteAction>
									</Items>
								</MyFSMenuCategory>
							</Items>
						</MyFSFlyoutAnchor>
						<!-- ************************** End: Test of small items **************************** -->

						<MyFSExecuteAction>
							<Label>Random Other: 4</Label>
							<ImageSource>:stdicon(IDI_APPLICATION)</ImageSource>
							<IsVisible>true</IsVisible>
							<Enabled>true</Enabled>
						</MyFSExecuteAction>
					</Items>
				</MyFSMenuCategory>
			</Items>
			<FooterItems>
				<MyFSExecuteAction>
					<Label>Word Options</Label>
					<IsVisible>true</IsVisible>
					<Enabled>true</Enabled>
				</MyFSExecuteAction>
				<MyFSExecuteAction>
					<Label>Exit Word</Label>
					<IsVisible>true</IsVisible>
					<Enabled>true</Enabled>
				</MyFSExecuteAction>
			</FooterItems>
		</MyFSFileMenuAnchor>

</FlexUI>
