Class {
	#name : #WAOpenGraphElement,
	#superclass : #WAObject,
	#instVars : [
		'name',
		'extras',
		'content'
	],
	#category : #'Seaside-OpenGraph-Core'
}

{ #category : #'as yet unclassified' }
WAOpenGraphElement class >> named: aString content: contentString [

	^ (self basicNew initializeWith: aString)
		  content: contentString;
		  yourself
]

{ #category : #initialization }
WAOpenGraphElement >> content: aString [ 

	content := aString
]

{ #category : #initialization }
WAOpenGraphElement >> extraAt: propertyName put: aString [
	"Sets aString as the content for the structured propertyName."
	
	self extras at: propertyName put: aString
]

{ #category : #initialization }
WAOpenGraphElement >> extras [ 
	^extras
]

{ #category : #initialization }
WAOpenGraphElement >> initialize [ 

	super initialize.
	name := self propertyName.
	extras := GRSmallDictionary new.
]

{ #category : #initialization }
WAOpenGraphElement >> propertyName [ 

	self subclassResponsibility 
]

{ #category : #initialization }
WAOpenGraphElement >> updateBasicsIntoRoot: anHtmlRoot [

	content notNil ifTrue: [ 
		anHtmlRoot meta
			name: 'og:' , name;
			content: content ]
]

{ #category : #initialization }
WAOpenGraphElement >> updateExtrasIntoRoot: anHtmlRoot [

	self extras keysAndValuesDo: [ :property :value | 
		anHtmlRoot meta
			name: 'og:' , name , ':' , property;
			content: value ]
]

{ #category : #initialization }
WAOpenGraphElement >> updateRoot: anHtmlRoot [

	self updateBasicsIntoRoot: anHtmlRoot.
	self updateExtrasIntoRoot: anHtmlRoot
]
