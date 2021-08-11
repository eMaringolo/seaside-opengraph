"
I'm an [OpenGraph](https://ogp.me/) Descriptor containing elements
that describe different properties of me.

I can render myself into a ̀WAHtmlRoot̀ by means of ̀#updateRoot:̀ and:  ̀#updateRoot:meta:̀.

There are some convenience accessors that will create and add particular elements (subclasses of ̀WAOpenGraphElement̀) into me, like ̀#title:̀,  ̀#image:̀ and ̀#description:̀.




"
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

{ #category : #properties }
WAOpenGraphDescriptor >> description [

	^ (self propertyAt: 'description') ifNotNil: [ :element | 
		  element content ]
]

{ #category : #properties }
WAOpenGraphDescriptor >> description: aString [

	^self addElement: (WAOpenGraphProperty named: 'description' content: aString)
]

{ #category : #'private-accessing' }
WAOpenGraphDescriptor >> elements [ 
	
	^elements
]

{ #category : #social }
WAOpenGraphDescriptor >> fbAppId: aString [

	^self addElement: (WAOpenGraphProperty prefix: 'fb' named: 'app_id' content: aString)
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
WAOpenGraphDescriptor >> propertyAt: propertyName [

	^ self elements
		  detect: [ :one | one name = propertyName ]
		  ifNone: [  ]
]

{ #category : #properties }
WAOpenGraphDescriptor >> title [

	^ (self propertyAt: 'title') ifNotNil: [ :element | 
		  element content ]
]

{ #category : #properties }
WAOpenGraphDescriptor >> title: aString [

	^self addElement: (WAOpenGraphProperty named: 'title' content: aString)
]

{ #category : #'properties-basic' }
WAOpenGraphDescriptor >> type: aString [

	^ (self addElement: WAOpenGraphType new) content: aString
]

{ #category : #operations }
WAOpenGraphDescriptor >> updateRoot: anHtmlRoot [
	"Updates anHtmlRoot with receiver properties."

	self updateRoot: anHtmlRoot meta: false
]

{ #category : #operations }
WAOpenGraphDescriptor >> updateRoot: anHtmlRoot meta: aBoolean [
	"Updates anHtmlRoot with the properties of receiver.
	If aBoolean is true, it also updates basic properties 
	of anHtmlRoot (title, description, etc.)."

	aBoolean ifTrue: [ self updateRootMeta: anHtmlRoot ].
	self elements do: [ :each | each updateRoot: anHtmlRoot ]
]

{ #category : #operations }
WAOpenGraphDescriptor >> updateRootMeta: anHtmlRoot [

	self title ifNotNil: [ :title | anHtmlRoot title: title ].
	self description ifNotNil: [ :description | 
		anHtmlRoot meta
			name: 'description';
			content: description ]
]

{ #category : #'properties-basic' }
WAOpenGraphDescriptor >> url: stringOrWAUrl [

	^ self addElement: (WAOpenGraphProperty named: 'url' content: stringOrWAUrl)
]
