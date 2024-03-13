Class {
	#name : #BaselineOfTestRepo,
	#superclass : #BaselineOf,
	#category : #BaselineOfTestRepo
}

{ #category : #loading }
BaselineOfTestRepo class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'testRepo' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfTestRepo >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'TestRepo'
		]
]
