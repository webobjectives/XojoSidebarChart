#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyFiles1
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vU2lkZWJhckNoYXJ0LnJlc291cmNl
				End
				Begin SignProjectStep Sign
				  DeveloperID=
				  macOSEntitlements={"App Sandbox":"False","Hardened Runtime":"False","Notarize":"False","UserEntitlements":""}
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyFiles2
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vU2lkZWJhckNoYXJ0LnJlc291cmNl
				End
			End
#tag EndBuildAutomation
