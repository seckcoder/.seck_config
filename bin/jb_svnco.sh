#!/bin/bash

# mobile
URL=${URL:-https://192.168.10.26/svn/jike/coding}
#DIRS=${DIRS:-infrastructure indexing -sentiment image mobplate lunabox spam web_util query_rewriter search_feature searchroot crawl ext_libs nlp page_analysis news_search}
DIRS=${DIRS:-word_segmentor}

# news search
#URL=${URL:-https://192.168.10.26/svn/jike/branches/news-dev}
#DIRS=${DIRS:-devel libs third_party testing util file news_search page_analysis word_segmentor ext_libs infrastructure indexing image mobplate social spam web_util lunabox query_rewriter search_feature searchroot crawl nlp}


function co_unit
{
    echo "start checkout $1"
    #echo "svn co $1"
    svn co "$1"
    echo "checkout $1 end"
}
for dir in $DIRS
do
    (co_unit "$URL/$dir"&)
done
