allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Ensure Gradle wrapper uses at least 8.13 (required by Android Gradle Plugin)
try {
    val wrapperFile = file("gradle/wrapper/gradle-wrapper.properties")
    if (wrapperFile.exists()) {
        val text = wrapperFile.readText()
        if (!text.contains("gradle-8.13") && !text.contains("gradle-8.1") ) {
            val updated = text.replace(Regex("gradle-[0-9]+\\.[0-9]+(\\.[0-9]+)?-bin\\.zip"), "gradle-8.13-bin.zip")
            if (updated != text) wrapperFile.writeText(updated)
        }
    }
} catch (e: Exception) {
    // ignore failures here; user can update wrapper manually
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    if (project.name != "app") {
        project.evaluationDependsOn(":app")
    }
}
