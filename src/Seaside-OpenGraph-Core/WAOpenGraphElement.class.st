"
I'm the common superclass of all open graph properties and types.
"
Class {
	#name : #WAOpenGraphElement,
	#superclass : #WAObject,
	#instVars : [
		'prefix',
		'name',
		'extras',
		'content'
	],
	#category : #'Seaside-OpenGraph-Core'
}

{ #category : #'instance creation' }
WAOpenGraphElement class >> named: aString [

	^self new 
		setName: aString;
		yourself
]

{ #category : #'as yet unclassified' }
WAOpenGraphElement class >> named: aString content: contentString [

	^ (self named: aString)
		  content: contentString;
		  yourself
]

{ #category : #'as yet unclassified' }
WAOpenGraphElement class >> prefix: prefixString named: aString content: contentString [

	^(self named: aString content: contentString)
		setPrefix: prefixString;
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
	prefix := 'og'.
	name := self propertyName.
	extras := GRSmallDictionary new.
]

{ #category : #initialization }
WAOpenGraphElement >> propertyName [ 

	^'void'
]

{ #category : #initialization }
WAOpenGraphElement >> setName: aString [
	"Private - Sets the name of receiver to be aString."
	
	name := aString
]

{ #category : #initialization }
WAOpenGraphElement >> setPrefix: aString [
	"Private - Sets the prefix of receiver to be aString."
	
	prefix := aString
]

{ #category : #initialization }
WAOpenGraphElement >> updateBasicsIntoRoot: anHtmlRoot [

	content notNil ifTrue: [ 
		anHtmlRoot meta
			attributeAt: 'property' put: prefix, ':' , name;
			content: content ]
]

{ #category : #initialization }
WAOpenGraphElement >> updateExtrasIntoRoot: anHtmlRoot [

	self extras keysAndValuesDo: [ :property :value | 
		anHtmlRoot meta
			attributeAt: 'property' put: prefix, ':' , name , ':' , property;
			content: value ]
]

{ #category : #initialization }
WAOpenGraphElement >> updateRoot: anHtmlRoot [

	self updateBasicsIntoRoot: anHtmlRoot.
	self updateExtrasIntoRoot: anHtmlRoot
]
