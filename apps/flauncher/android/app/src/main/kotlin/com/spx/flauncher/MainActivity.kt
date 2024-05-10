package com.spx.flauncher

import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream


class MainActivity : FlutterActivity() {
    val TAG = "flutter_MainActivity"
    override fun onCreate(savedInstanceState: Bundle?) {
        Log.i(TAG, "onCreate: ...Enter")
//        val appInstallDir = packageManager.getApplicationInfo(packageName, 0).sourceDir
//        Log.i(TAG, "onCreate: ...appInstallDir:${appInstallDir}")
//        val applicationInfo = applicationInfo
//        val soInstallDir = File(applicationInfo.nativeLibraryDir).absolutePath
//        Log.i(TAG, "onCreate: ...soInstallDir:${soInstallDir}")
//        val removed = renameFile(soInstallDir+"/libapp.so", "libapp2.so");
//        Log.i(TAG, "onCreate: ...removed:${removed}")
        super.onCreate(savedInstanceState)
        Log.i(TAG, "onCreate: ...X")
    }

    override fun onResume() {
        Log.i(TAG, "onResume: ...Enter")
        super.onResume()
        Log.i(TAG, "onResume: ...X")
    }

//    override fun getFlutterShellArgs(): FlutterShellArgs {
//        Log.i(TAG, "getFlutterShellArgs: ...Enter")
//        val soInstallDir = File(applicationInfo.nativeLibraryDir).absolutePath
//        Log.i(TAG, "getFlutterShellArgs: ...soInstallDir:${soInstallDir}")
//        val internalStorageDir = context.filesDir
//
//        // 构造文件对象
//
//        // 构造文件对象
//        val privateFile = File(internalStorageDir, "libapp2.so")
//        Log.i(TAG, "getFlutterShellArgs: privateFile:${privateFile.absolutePath}")
//
//        return super.getFlutterShellArgs().apply {
////            this.add( "--aot-shared-library-name=libapp2.so" )
////            this.add( "--aot-shared-library-name=${privateFile.absolutePath}" )
////            this.add( "--aot-shared-library-name=libapp.so" )
////            this.add( "--aot-shared-library-name=${privateFile.absolutePath}" )
//        }
//    }

    fun copyFile(sourceFile: File, newFile: File): Boolean {
        Log.i(TAG, "copyFile: sourceFile.length:${sourceFile.length()}")

        try {
            FileInputStream(sourceFile).use { inputStream ->
                FileOutputStream(newFile).use { outputStream ->
                    inputStream.channel.use { inChannel ->
                        outputStream.channel.use { outChannel ->
                            // 使用文件通道的transferTo方法进行文件复制
                            inChannel.transferTo(0, inChannel.size(), outChannel)
                            return true
                        }
                    }
                }
            }
        } catch (e: Exception) {
            // 复制失败
            e.printStackTrace()
            Log.e(TAG, "copyFile:failed ", e)
            return false
        }
    }

    fun renameFile(oldPath: String?, newFileName: String): Boolean {
        val oldFile = File(oldPath)
        Log.i(TAG, "renameFile: oldFile:${oldFile}")
        val internalStorageDir = context.filesDir

        // 构造文件对象

        // 构造文件对象
        val privateFile = File(internalStorageDir, newFileName)
        Log.i(TAG, "renameFile: privateFile:${privateFile.absolutePath}")

        // 判断文件是否存在
        return if (oldFile.exists()) {
            // 构造新的文件名
            val parentPath = oldFile.parent
//            val newFilePath = parentPath + File.separator + newFileName
//            val newFile = File(newFilePath)

//            Log.i(TAG, "renameFile: newFilePath:${newFilePath}")
            // 重命名文件
            if (copyFile(oldFile, privateFile)) {
                true
            } else {
                Log.i(TAG, "renameFile: failed1")
                // 重命名失败，可能是权限不足等原因
                false
            }
        } else {
            // 文件不存在
            Log.i(TAG, "renameFile: failed2")
            false
        }
    }
}
