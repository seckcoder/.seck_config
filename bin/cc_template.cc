// Copyright 2013 jike Inc. All Rights Reserved.
// Author: liwei@jike.com (Li Wei)

#include "base/logging.h"
#include "base/flags.h"

DEFINE_string(xxx, "", "");

int main(int argc, char *argv[]) {
  base::ParseCommandLineFlags(&argc, &argv, true);
  InitLogging("logfname.log",
              LOG_ONLY_TO_FILE,
              // LOG_ONLY_TO_SYSTEM_DEBUG_LOG,
              LOCK_LOG_FILE,
              DELETE_OLD_LOG_FILE);
  return 0;
}
