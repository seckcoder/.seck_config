# replace #include "page_analysis/topicclassify/*" 
# with #include "msfpl/baoguangtai/topicclassify/*"
s;\(#include\s*"\)msfpl/baoguangtai\(/topicclassify\);\1mobile/wtx\2;
s;\(#include\s*"\)msfpl/baoguangtai/\(/topicclassify\);\1mobile/wtx\2;

# replace #ifndef PAGE_ANALYSIS_TOPICCLASSIFY_*
# with #ifndef MSFPL_BAOGUANGTAI_TOPICCLASSIFY_*
s;\(\(#define\|#ifndef\|#endif\s*//\)\s*\)MSFPL_BAOGUANGTAI_TOPICCLASSIFY_;\1MOBILE_WTX_TOPICCLASSIFY_;
