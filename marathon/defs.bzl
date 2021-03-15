def _marathon_android_test_impl(ctx):
    app = ctx.attr.test_app[AndroidInstrumentationInfo].target.signed_apk
    test_app = ctx.attr.test_app[ApkInfo].signed_apk
    marathonfile = ctx.actions.declare_file("Marathonfile")

    runfiles = ctx.runfiles(
        files = [
            ctx.file._marathon,
            app,
            test_app,
            marathonfile,
            ctx.file._adb,
        ] + ctx.files._androidsdk_files,
    )

    adb_path = ctx.expand_location("$(location @androidsdk//:adb)", [ctx.attr._adb])
    sdk_path = adb_path.split("adb")[0] + ".."

    ctx.actions.expand_template(
        template = ctx.file._marathonfile_template,
        output = marathonfile,
        substitutions = {
            "{name}": ctx.label.name,
            "{applicationApk}": app.short_path,
            "{testApplicationApk}": test_app.short_path,
            "{outputDir}": "/tmp",
            "{androidSdk}": sdk_path,
        },
    )

    test_cmd = [
        ctx.file._marathon.short_path, "--marathonfile", marathonfile.short_path,
    ]

    chmod_app_cmd = [
        "chmod", "+w", app.short_path, '\n'
    ]
    chmod_test_app_cmd = [
        "chmod", "+w", test_app.short_path, '\n'
    ]

    script = " ".join(chmod_app_cmd) + " ".join(chmod_test_app_cmd) + " ".join(test_cmd)

    test_runner = ctx.actions.declare_file("test_runner.sh")
    ctx.actions.write(test_runner, script, True)

    return [
        DefaultInfo(
            executable = test_runner,
            runfiles = runfiles,
        )
    ]

marathon_android_test = rule(
    implementation = _marathon_android_test_impl,
    attrs = {
        "test_app": attr.label(
            providers = [AndroidInstrumentationInfo]
        ),
        "_adb": attr.label(
            default = "@androidsdk//:adb",
            allow_single_file = True,
        ),
        "_androidsdk_files": attr.label(
            default = "@androidsdk//:files",
            allow_files = True,
        ),
        "_marathon": attr.label(
            default = "//third_party/marathon-0.7.0-SNAPSHOT:bin/marathon",
            allow_single_file = True,
            executable = True,
            cfg = "host",
        ),
        "_marathonfile_template": attr.label(
            default = "//marathon:Marathonfile.tpl",
            allow_single_file = True,
            cfg = "host",
        ),
    },
    test = True,
)
