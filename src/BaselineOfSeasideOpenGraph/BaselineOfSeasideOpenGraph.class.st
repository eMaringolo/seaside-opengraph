Class {
	#name : #BaselineOfSeasideOpenGraph,
	#superclass : #BaselineOf,
	#category : #BaselineOfSeasideOpenGraph
}

{ #category : #baselines }
BaselineOfSeasideOpenGraph >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'Seaside-OpenGraph-Core';
			package: 'Seaside-OpenGraph-Tests'
			  with: [ spec requires: 'Seaside-OpenGraph-Core' ];
			package: 'Seaside-OpenGraph-Examples'
			  with: [ spec requires: #( 'Seaside-OpenGraph-Core' ) ].

		spec
			group: 'Core' with: #( 'Seaside-OpenGraph-Core' );
			group: 'Tests' with: #( 'Seaside-OpenGraph-Tests' );
			group: 'Examples' with: #( 'Seaside-OpenGraph-Examples' 'Core' 'Tests' );
			group: 'default' with: #( 'Core' 'Tests' ) ]
]
