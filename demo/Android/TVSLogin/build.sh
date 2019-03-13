export ANDROID_HOME=$ANDROID_SDK
export JAVA_HOME=$JDK8
export PATH=$JDK8/bin:$GRADLE_HOME/bin:$PATH

export GRADLE_HOME=/data/rdm/apps/gradle/gradle-4.4.1
export PATH=$GRADLE_HOME/bin:$PATH

# clean dir
rm -rf bin
mkdir bin

echo '----------tvsloginlib process start----------'

cd ${WORKSPACE}/TVSLoginWithModule/TVSLogin/tvsloginlib

# clean project
echo 'gradle clean start'
info=`gradle clean`
echo ${info}
if [[ $info =~ "BUILD SUCCESSFUL" ]]
then
    echo "gradle clean result:BUILD SUCCESSFUL"
else
    echo "gradle clean result:BUILD FAILED"
    exit 1
fi
echo 'gradle clean end'


#gradle build
echo 'gradle build start'
info=`gradle assembleRelease `
echo ${info}
if [[ $info =~ "BUILD SUCCESSFUL" ]]
then
    echo "gradle build result:BUILD SUCCESSFUL"
else
    echo "gradle build result:BUILD FAILED"
    exit 1
fi
echo 'gradle build end'

# copy aar
echo "copy aar start"
cp ${WORKSPACE}/TVSLoginWithModule/TVSLogin/tvsloginlib/build/outputs/aar/*    ${WORKSPACE}/bin/
echo "copy aar end"

echo '----------tvsloginlib process end----------'


echo '----------tvsdevicelib process start----------'

cd ${WORKSPACE}/TVSLoginWithModule/TVSLogin/tvsdevicelib

# clean project
echo 'gradle clean start'
info=`gradle clean`
echo ${info}
if [[ $info =~ "BUILD SUCCESSFUL" ]]
then
    echo "gradle clean result:BUILD SUCCESSFUL"
else
    echo "gradle clean result:BUILD FAILED"
    exit 1
fi
echo 'gradle clean end'


#gradle build
echo 'gradle build start'
info=`gradle assembleRelease `
echo ${info}
if [[ $info =~ "BUILD SUCCESSFUL" ]]
then
    echo "gradle build result:BUILD SUCCESSFUL"
else
    echo "gradle build result:BUILD FAILED"
    exit 1
fi
echo 'gradle build end'

# copy aar
echo "copy aar start"
cp ${WORKSPACE}/TVSLoginWithModule/TVSLogin/tvsdevicelib/build/outputs/aar/*    ${WORKSPACE}/bin/
echo "copy aar end"

echo '----------tvsdevicelib process end----------'