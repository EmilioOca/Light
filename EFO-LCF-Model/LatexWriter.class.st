Class {
	#name : #LatexWriter,
	#superclass : #Object,
	#category : #'EFO-LCF-Model'
}

{ #category : #'as yet unclassified' }
LatexWriter >> endOn: aStream [
        aStream nextPutAll:'\end{tabular}'; cr.
        aStream cr; cr.
        aStream nextPutAll: '\end{document}'; cr


]

{ #category : #'as yet unclassified' }
LatexWriter >> generateLaTeX: aFileName [
        | aFile |
        aFile := CrLfFileStream fileNamed: aFileName, '.tex'.
        aFile lineEndConvention: #crlf.
        self startOn: aFile.
 "       self usecases do: [:each| self printUseCase: each on: aFile]."
        self endOn: aFile.
        aFile close


]

{ #category : #'as yet unclassified' }
LatexWriter >> printUseCase: aUseCase on: aStream [
        aStream nextPutAll: (aUseCase usecaseName) ,' & ',(aUseCase usecaseDescription)

]

{ #category : #'as yet unclassified' }
LatexWriter >> startOn: aStream [
        aStream nextPutAll:'\documentclass[12pt,a4paper]{article}'; cr.
        aStream nextPutAll:'\usepackage[english,dutch]{babel}'; cr.
        aStream nextPutAll:'\begin{document}'; cr.
        aStream nextPutAll: '\begin{tabular}{|l|l|}'; cr.
        aStream nextPutAll: '\hline ';cr.

]
