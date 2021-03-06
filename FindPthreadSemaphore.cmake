# - Try to find pThreadSemaphore
# Once done this will define
#
#  PTHREAD_SEMAPHORE_FOUND - system has pThreadSemaphore
#  PTHREAD_SEMAPHORE_INCLUDE_DIR - the pThreadSemaphore include directory
#  PTHREAD_SEMAPHORE_LIBRARIES - Link these to use pThreadSemaphore
#

FIND_PATH(PTHREAD_SEMAPHORE_INCLUDE_DIR NAMES semaphore.h
  PATHS
  ${PROJECT_BINARY_DIR}/include
  ${PROJECT_SOURCE_DIR}/include
  ${PROJECT_SOURCE_DIR}/libraries/pthread/include
  NO_DEFAULT_PATH
)

FIND_LIBRARY(PTHREAD_SEMAPHORE_LIBRARY NAMES
  pthreadGC2
  PATHS
  ${PROJECT_BINARY_DIR}/lib
  ${PROJECT_SOURCE_DIR}/lib
  ${PROJECT_SOURCE_DIR}/libraries/pthread/lib
  NO_DEFAULT_PATH
)

IF(PTHREAD_SEMAPHORE_INCLUDE_DIR AND PTHREAD_SEMAPHORE_LIBRARY)
   SET(PTHREAD_SEMAPHORE_FOUND TRUE)
ENDIF(PTHREAD_SEMAPHORE_INCLUDE_DIR AND PTHREAD_SEMAPHORE_LIBRARY)

# show the GLEW_INCLUDE_DIR and GLEW_LIBRARIES variables only in the advanced view
IF(PTHREAD_SEMAPHORE_FOUND)
  MARK_AS_ADVANCED(PTHREAD_SEMAPHORE_INCLUDE_DIR PTHREAD_SEMAPHORE_LIBRARIES)
  INCLUDE_DIRECTORIES(${PTHREAD_SEMAPHORE_INCLUDE_DIR})
ELSE (PTHREAD_SEMAPHORE_FOUND)
	MESSAGE ("WARNING: Could not find pThread - depending targets will be disabled.")
	SET(OE_MISSING_LIBS "${OE_MISSING_LIBS}, pThreadSemaphore")
ENDIF(PTHREAD_SEMAPHORE_FOUND)
