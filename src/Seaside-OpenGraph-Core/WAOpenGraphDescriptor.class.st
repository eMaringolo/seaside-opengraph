Class {
	#name : #WAOpenGraphDescriptor,
	#superclass : #WAObject,
	#instVars : [
		'elements'
	],
	#category : #'Seaside-OpenGraph-Core'
}

{ #category : #'instance creation' }
WAOpenGraphDescriptor class >> root: anHtmlRoot [

	^self new
		setRoot: anHtmlRoot;
		yourself
]

{ #category : #elements }
WAOpenGraphDescriptor >> addElement: aWAOpenGraphElement [

	^self elements add: aWAOpenGraphElement
]

{ #category : #'type-convenience' }
WAOpenGraphDescriptor >> beArticle [

	self type: 'article'
]

{ #category : #'properties-basic' }
WAOpenGraphDescriptor >> description: aString [

	self propertyAt: 'description' add: aString
]

{ #category : #properties }
WAOpenGraphDescriptor >> elements [ 
	
	^elements
]

{ #category : #'properties-basic' }
WAOpenGraphDescriptor >> image [ 

	^self addElement: (WAOpenGraphImage new)
]

{ #category : #'properties-basic' }
WAOpenGraphDescriptor >> image: stringOrWAUrl [

	^self image url: stringOrWAUrl; yourself
]

{ #category : #initialization }
WAOpenGraphDescriptor >> initialize [

	super initialize.
	elements := OrderedCollection new
]

{ #category : #properties }
WAOpenGraphDescriptor >> title [

	^self addElement: (WAOpenGraphTitle new)
]

{ #category : #'properties-basic' }
WAOpenGraphDescriptor >> title: aString [

	self title content: aString
]

{ #category : #'properties-basic' }
WAOpenGraphDescriptor >> type: aString [

	^ (self addElement: WAOpenGraphType new) content: aString
]

{ #category : #operations }
WAOpenGraphDescriptor >> updateRoot: anHtmlRoot [

	self elements do: [ :each | each updateRoot: anHtmlRoot ]
]

{ #category : #'properties-basic' }
WAOpenGraphDescriptor >> url: stringOrWAUrl [

	^ (self addElement: WAOpenGraphUrl new) content: stringOrWAUrl
]
