# Create the extension library

SET( EXTENSION_NAME "Extensions_pThreadSemaphore")

ADD_LIBRARY( ${EXTENSION_NAME}
	dummy.cpp
	Core/Semaphore.h
)

TARGET_LINK_LIBRARIES( ${EXTENSION_NAME}
  ${PTHREAD_SEMAPHORE_LIBRARY}
)

