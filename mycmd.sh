#!/bin/bash
for line in $(cat input/sp/chosen_annotations)
do
	mkdir -p output/$line
	mallet import-file --input input/$line --output output/$line/all.mallet --keep-sequence --remove-stopwords --extra-stopwords input/sp/java_stop_words.txt
	mallet train-topics --input output/$line/all.mallet --num-topics 2 --num-topics 10 --num-iterations 10000 --optimize-burn-in 1000 --optimize-interval 100 --output-state output/$line/all-topic-state.gz --output-topic-keys output/$line/all-keys.txt --output-doc-topics output/$line/all-composition.txt --xml-topic-phrase-report output/$line/all-topic-phrases.xml --word-topic-counts-file output/$line/all-word-top.txt
done