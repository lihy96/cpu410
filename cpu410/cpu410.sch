<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2(15:0)" />
        <signal name="XLXN_3(15:0)" />
        <signal name="XLXN_4(15:0)" />
        <signal name="XLXN_5(15:0)" />
        <signal name="XLXN_6(1:0)" />
        <signal name="XLXN_7(15:0)" />
        <signal name="XLXN_8(15:0)" />
        <signal name="XLXN_9(15:0)" />
        <signal name="XLXN_10(3:0)" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12(15:0)" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18(15:0)" />
        <signal name="XLXN_20(1:0)" />
        <signal name="XLXN_21(15:0)" />
        <signal name="XLXN_22(15:0)" />
        <signal name="XLXN_23(15:0)" />
        <signal name="XLXN_24(15:0)" />
        <signal name="XLXN_25(15:0)" />
        <signal name="XLXN_28(15:0)" />
        <signal name="XLXN_29(15:0)" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_34(15:0)" />
        <signal name="XLXN_35(15:0)" />
        <signal name="XLXN_36(15:0)" />
        <blockdef name="alu">
            <timestamp>2016-11-21T15:51:13</timestamp>
            <rect width="304" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-172" height="24" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
        </blockdef>
        <blockdef name="adder">
            <timestamp>2016-11-21T15:51:5</timestamp>
            <rect width="288" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="352" y="-108" height="24" />
            <line x2="416" y1="-96" y2="-96" x1="352" />
        </blockdef>
        <blockdef name="if_id_latch">
            <timestamp>2016-11-21T15:52:18</timestamp>
            <rect width="400" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="464" y="-300" height="24" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <rect width="64" x="464" y="-172" height="24" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <blockdef name="id_ex_latch">
            <timestamp>2016-11-21T15:52:7</timestamp>
            <rect width="448" x="64" y="-960" height="960" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="576" y1="-928" y2="-928" x1="512" />
            <line x2="576" y1="-864" y2="-864" x1="512" />
            <line x2="576" y1="-800" y2="-800" x1="512" />
            <rect width="64" x="512" y="-748" height="24" />
            <line x2="576" y1="-736" y2="-736" x1="512" />
            <rect width="64" x="512" y="-684" height="24" />
            <line x2="576" y1="-672" y2="-672" x1="512" />
            <rect width="64" x="512" y="-620" height="24" />
            <line x2="576" y1="-608" y2="-608" x1="512" />
            <rect width="64" x="512" y="-556" height="24" />
            <line x2="576" y1="-544" y2="-544" x1="512" />
            <rect width="64" x="512" y="-492" height="24" />
            <line x2="576" y1="-480" y2="-480" x1="512" />
            <rect width="64" x="512" y="-428" height="24" />
            <line x2="576" y1="-416" y2="-416" x1="512" />
            <rect width="64" x="512" y="-364" height="24" />
            <line x2="576" y1="-352" y2="-352" x1="512" />
            <rect width="64" x="512" y="-300" height="24" />
            <line x2="576" y1="-288" y2="-288" x1="512" />
            <rect width="64" x="512" y="-236" height="24" />
            <line x2="576" y1="-224" y2="-224" x1="512" />
            <rect width="64" x="512" y="-172" height="24" />
            <line x2="576" y1="-160" y2="-160" x1="512" />
            <rect width="64" x="512" y="-108" height="24" />
            <line x2="576" y1="-96" y2="-96" x1="512" />
            <rect width="64" x="512" y="-44" height="24" />
            <line x2="576" y1="-32" y2="-32" x1="512" />
        </blockdef>
        <blockdef name="mem_wb_latch">
            <timestamp>2016-11-21T15:52:35</timestamp>
            <rect width="416" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="544" y1="-352" y2="-352" x1="480" />
            <line x2="544" y1="-288" y2="-288" x1="480" />
            <rect width="64" x="480" y="-236" height="24" />
            <line x2="544" y1="-224" y2="-224" x1="480" />
            <rect width="64" x="480" y="-172" height="24" />
            <line x2="544" y1="-160" y2="-160" x1="480" />
            <rect width="64" x="480" y="-108" height="24" />
            <line x2="544" y1="-96" y2="-96" x1="480" />
            <rect width="64" x="480" y="-44" height="24" />
            <line x2="544" y1="-32" y2="-32" x1="480" />
        </blockdef>
        <blockdef name="ex_mem_latch">
            <timestamp>2016-11-21T15:51:41</timestamp>
            <rect width="512" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="640" y1="-480" y2="-480" x1="576" />
            <rect width="64" x="576" y="-428" height="24" />
            <line x2="640" y1="-416" y2="-416" x1="576" />
            <rect width="64" x="576" y="-364" height="24" />
            <line x2="640" y1="-352" y2="-352" x1="576" />
            <rect width="64" x="576" y="-300" height="24" />
            <line x2="640" y1="-288" y2="-288" x1="576" />
            <rect width="64" x="576" y="-236" height="24" />
            <line x2="640" y1="-224" y2="-224" x1="576" />
            <rect width="64" x="576" y="-172" height="24" />
            <line x2="640" y1="-160" y2="-160" x1="576" />
            <rect width="64" x="576" y="-108" height="24" />
            <line x2="640" y1="-96" y2="-96" x1="576" />
        </blockdef>
        <blockdef name="pc_reg">
            <timestamp>2016-11-21T15:53:24</timestamp>
            <rect width="320" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-236" height="24" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
        </blockdef>
        <blockdef name="pc_adder">
            <timestamp>2016-11-21T15:53:18</timestamp>
            <rect width="400" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <blockdef name="inst_ram">
            <timestamp>2016-11-21T15:52:24</timestamp>
            <rect width="480" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-268" height="24" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-76" height="24" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="608" y1="-352" y2="-352" x1="544" />
            <line x2="608" y1="-288" y2="-288" x1="544" />
            <line x2="608" y1="-224" y2="-224" x1="544" />
            <rect width="64" x="544" y="-172" height="24" />
            <line x2="608" y1="-160" y2="-160" x1="544" />
            <rect width="64" x="544" y="-108" height="24" />
            <line x2="608" y1="-96" y2="-96" x1="544" />
            <rect width="64" x="544" y="-44" height="24" />
            <line x2="608" y1="-32" y2="-32" x1="544" />
        </blockdef>
        <blockdef name="mux3">
            <timestamp>2016-11-21T15:52:48</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
        </blockdef>
        <blockdef name="registers">
            <timestamp>2016-11-22T3:45:59</timestamp>
            <rect width="336" x="64" y="-576" height="576" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="400" y="-556" height="24" />
            <line x2="464" y1="-544" y2="-544" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <blockdef name="mem_ctrl">
            <timestamp>2016-11-21T15:52:29</timestamp>
            <rect width="480" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="608" y1="-480" y2="-480" x1="544" />
            <line x2="608" y1="-416" y2="-416" x1="544" />
            <line x2="608" y1="-352" y2="-352" x1="544" />
            <line x2="608" y1="-288" y2="-288" x1="544" />
            <line x2="608" y1="-224" y2="-224" x1="544" />
            <rect width="64" x="544" y="-172" height="24" />
            <line x2="608" y1="-160" y2="-160" x1="544" />
            <rect width="64" x="544" y="-108" height="24" />
            <line x2="608" y1="-96" y2="-96" x1="544" />
            <rect width="64" x="544" y="-44" height="24" />
            <line x2="608" y1="-32" y2="-32" x1="544" />
        </blockdef>
        <blockdef name="wb_mux">
            <timestamp>2016-11-21T15:53:36</timestamp>
            <rect width="464" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="528" y="-300" height="24" />
            <line x2="592" y1="-288" y2="-288" x1="528" />
        </blockdef>
        <blockdef name="cmp8k">
            <timestamp>2016-11-21T15:51:24</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="mux5">
            <timestamp>2016-11-21T15:53:0</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
        </blockdef>
        <blockdef name="mux2_pc_inst">
            <timestamp>2016-11-22T3:53:25</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="controller">
            <timestamp>2016-11-22T12:53:3</timestamp>
            <rect width="368" x="64" y="-640" height="640" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="496" y1="-608" y2="-608" x1="432" />
            <line x2="496" y1="-544" y2="-544" x1="432" />
            <line x2="496" y1="-480" y2="-480" x1="432" />
            <line x2="496" y1="-416" y2="-416" x1="432" />
            <line x2="496" y1="-352" y2="-352" x1="432" />
            <line x2="496" y1="-288" y2="-288" x1="432" />
            <rect width="64" x="432" y="-236" height="24" />
            <line x2="496" y1="-224" y2="-224" x1="432" />
            <rect width="64" x="432" y="-172" height="24" />
            <line x2="496" y1="-160" y2="-160" x1="432" />
            <rect width="64" x="432" y="-108" height="24" />
            <line x2="496" y1="-96" y2="-96" x1="432" />
            <rect width="64" x="432" y="-44" height="24" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
        </blockdef>
        <blockdef name="mux3_pc">
            <timestamp>2016-11-22T17:10:47</timestamp>
            <rect width="384" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="448" y="-300" height="24" />
            <line x2="512" y1="-288" y2="-288" x1="448" />
        </blockdef>
        <blockdef name="and_xor_equal">
            <timestamp>2016-11-22T17:9:57</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
        </blockdef>
        <block symbolname="if_id_latch" name="XLXI_3">
            <blockpin name="clk" />
            <blockpin name="pause" />
            <blockpin signalname="XLXN_18(15:0)" name="in_pc(15:0)" />
            <blockpin signalname="XLXN_22(15:0)" name="in_pc_plus1(15:0)" />
            <blockpin signalname="XLXN_21(15:0)" name="in_inst(15:0)" />
            <blockpin signalname="XLXN_24(15:0)" name="out_pc(15:0)" />
            <blockpin signalname="XLXN_23(15:0)" name="out_pc_plus1(15:0)" />
            <blockpin signalname="XLXN_29(15:0)" name="out_inst(15:0)" />
        </block>
        <block symbolname="id_ex_latch" name="XLXI_4">
            <blockpin name="clk" />
            <blockpin name="in_wb" />
            <blockpin name="in_mem" />
            <blockpin name="in_ex" />
            <blockpin name="in_Rx_val(15:0)" />
            <blockpin name="in_Ry_val(15:0)" />
            <blockpin name="in_imme(15:0)" />
            <blockpin signalname="XLXN_24(15:0)" name="in_pc(15:0)" />
            <blockpin name="in_Rx_num(3:0)" />
            <blockpin name="in_Ry_num(3:0)" />
            <blockpin name="in_Rz_num(3:0)" />
            <blockpin name="in_T_num(3:0)" />
            <blockpin name="in_SP_num(3:0)" />
            <blockpin signalname="XLXN_17" name="out_wb_ctrl" />
            <blockpin signalname="XLXN_16" name="out_mem_ctrl" />
            <blockpin name="out_alu1_ri_choose" />
            <blockpin name="out_pause(1:0)" />
            <blockpin name="out_reg_num_choose(2:0)" />
            <blockpin name="out_alu_op(4:0)" />
            <blockpin name="out_Rx_val(15:0)" />
            <blockpin name="out_Ry_val(15:0)" />
            <blockpin name="out_imme(15:0)" />
            <blockpin signalname="XLXN_25(15:0)" name="out_pc(15:0)" />
            <blockpin name="out_Rx_num(3:0)" />
            <blockpin name="out_Ry_num(3:0)" />
            <blockpin name="out_Rz_num(3:0)" />
            <blockpin name="out_T_num(3:0)" />
            <blockpin name="out_SP_num(3:0)" />
        </block>
        <block symbolname="mem_wb_latch" name="XLXI_5">
            <blockpin name="CLK" />
            <blockpin signalname="XLXN_11" name="IN_WB_CONTROL" />
            <blockpin signalname="XLXN_7(15:0)" name="IN_ADDR(15:0)" />
            <blockpin signalname="XLXN_5(15:0)" name="IN_DATA(15:0)" />
            <blockpin signalname="XLXN_9(15:0)" name="IN_PC(15:0)" />
            <blockpin signalname="XLXN_10(3:0)" name="IN_REG_NO(3:0)" />
            <blockpin signalname="XLXN_14" name="OUT_WB_CHOOSE" />
            <blockpin name="OUT_REG_WN" />
            <blockpin signalname="XLXN_3(15:0)" name="OUT_ADDR(15:0)" />
            <blockpin signalname="XLXN_2(15:0)" name="OUT_DATA(15:0)" />
            <blockpin signalname="XLXN_4(15:0)" name="OUT_PC(15:0)" />
            <blockpin name="OUT_REG_NO(3:0)" />
        </block>
        <block symbolname="ex_mem_latch" name="XLXI_6">
            <blockpin name="CLK" />
            <blockpin signalname="XLXN_17" name="IN_WB_CTRL" />
            <blockpin signalname="XLXN_16" name="IN_MEM_CTRL" />
            <blockpin signalname="XLXN_15" name="IN_CMP_RS" />
            <blockpin signalname="XLXN_12(15:0)" name="IN_ADDR(15:0)" />
            <blockpin name="IN_DATA(15:0)" />
            <blockpin signalname="XLXN_25(15:0)" name="IN_PC(15:0)" />
            <blockpin name="IN_REG_NO(3:0)" />
            <blockpin signalname="XLXN_11" name="OUT_WB_CONTROL" />
            <blockpin signalname="XLXN_7(15:0)" name="OUT_ADDR(15:0)" />
            <blockpin signalname="XLXN_8(15:0)" name="OUT_DATA(15:0)" />
            <blockpin signalname="XLXN_9(15:0)" name="OUT_PC(15:0)" />
            <blockpin signalname="XLXN_10(3:0)" name="OUT_REG_NO(3:0)" />
            <blockpin signalname="XLXN_6(1:0)" name="OUT_RAM1_READ_WRITE(1:0)" />
            <blockpin signalname="XLXN_20(1:0)" name="OUT_RAM2_READ_WRITE(1:0)" />
        </block>
        <block symbolname="pc_reg" name="XLXI_7">
            <blockpin name="rst" />
            <blockpin name="clk" />
            <blockpin name="pc_pause" />
            <blockpin signalname="XLXN_35(15:0)" name="new_pc(15:0)" />
            <blockpin signalname="XLXN_18(15:0)" name="pc_output(15:0)" />
        </block>
        <block symbolname="pc_adder" name="XLXI_8">
            <blockpin signalname="XLXN_18(15:0)" name="pc_adder_in(15:0)" />
            <blockpin signalname="XLXN_22(15:0)" name="pc_adder_out(15:0)" />
        </block>
        <block symbolname="inst_ram" name="XLXI_10">
            <blockpin name="CLK" />
            <blockpin signalname="XLXN_20(1:0)" name="RAM_READ_WRITE(1:0)" />
            <blockpin signalname="XLXN_28(15:0)" name="RAM_ADDR(15:0)" />
            <blockpin signalname="XLXN_8(15:0)" name="RAM_DATA(15:0)" />
            <blockpin name="Ram2OE" />
            <blockpin name="Ram2WE" />
            <blockpin name="Ram2EN" />
            <blockpin signalname="XLXN_21(15:0)" name="RAM_OUTPUT(15:0)" />
            <blockpin name="Ram2Addr(17:0)" />
            <blockpin name="Ram2Data(15:0)" />
        </block>
        <block symbolname="adder" name="XLXI_12">
            <blockpin signalname="XLXN_23(15:0)" name="pc_old(15:0)" />
            <blockpin name="imm(15:0)" />
            <blockpin signalname="XLXN_36(15:0)" name="pc_new(15:0)" />
        </block>
        <block symbolname="registers" name="XLXI_13">
            <blockpin name="clk" />
            <blockpin name="rst" />
            <blockpin name="write_en" />
            <blockpin name="r1_addr(3:0)" />
            <blockpin name="r2_addr(3:0)" />
            <blockpin name="write_addr(3:0)" />
            <blockpin name="write_data(15:0)" />
            <blockpin name="r1_data(15:0)" />
            <blockpin name="r2_data(15:0)" />
        </block>
        <block symbolname="mux3" name="XLXI_14">
            <blockpin name="data1(15:0)" />
            <blockpin name="data2(15:0)" />
            <blockpin name="data3(15:0)" />
            <blockpin name="choose(1:0)" />
            <blockpin name="outdata(15:0)" />
        </block>
        <block symbolname="mux3" name="XLXI_15">
            <blockpin name="data1(15:0)" />
            <blockpin name="data2(15:0)" />
            <blockpin name="data3(15:0)" />
            <blockpin name="choose(1:0)" />
            <blockpin name="outdata(15:0)" />
        </block>
        <block symbolname="alu" name="XLXI_16">
            <blockpin name="alu_op1(15:0)" />
            <blockpin name="alu_op2(15:0)" />
            <blockpin name="alu_inst(4:0)" />
            <blockpin signalname="XLXN_12(15:0)" name="alu_res(15:0)" />
        </block>
        <block symbolname="mem_ctrl" name="XLXI_18">
            <blockpin name="CLK" />
            <blockpin name="data_ready" />
            <blockpin name="tbre" />
            <blockpin name="tsre" />
            <blockpin signalname="XLXN_6(1:0)" name="RAM_READ_WRITE(1:0)" />
            <blockpin signalname="XLXN_7(15:0)" name="RAM_ADDR(15:0)" />
            <blockpin signalname="XLXN_8(15:0)" name="RAM_DATA(15:0)" />
            <blockpin name="Ram1OE" />
            <blockpin name="Ram1WE" />
            <blockpin name="Ram1EN" />
            <blockpin name="rdn" />
            <blockpin name="wrn" />
            <blockpin signalname="XLXN_5(15:0)" name="RAM_OUTPUT(15:0)" />
            <blockpin name="Ram1Addr(17:0)" />
            <blockpin name="Ram1Data(15:0)" />
        </block>
        <block symbolname="wb_mux" name="XLXI_19">
            <blockpin name="CLK" />
            <blockpin signalname="XLXN_14" name="IN_WB_CHOOSE" />
            <blockpin signalname="XLXN_3(15:0)" name="IN_ALU_DATA(15:0)" />
            <blockpin signalname="XLXN_2(15:0)" name="IN_MEM_DATA(15:0)" />
            <blockpin signalname="XLXN_4(15:0)" name="IN_PC(15:0)" />
            <blockpin name="OUT_WB_DATA(15:0)" />
        </block>
        <block symbolname="cmp8k" name="XLXI_20">
            <blockpin signalname="XLXN_12(15:0)" name="data_in(15:0)" />
            <blockpin signalname="XLXN_15" name="res" />
        </block>
        <block symbolname="mux5" name="XLXI_21">
            <blockpin name="data1(15:0)" />
            <blockpin name="data2(15:0)" />
            <blockpin name="data3(15:0)" />
            <blockpin name="data4(15:0)" />
            <blockpin name="data5(15:0)" />
            <blockpin name="choose(2:0)" />
            <blockpin name="outdata(15:0)" />
        </block>
        <block symbolname="mux2_pc_inst" name="XLXI_22">
            <blockpin signalname="XLXN_20(1:0)" name="choose(1:0)" />
            <blockpin signalname="XLXN_18(15:0)" name="pc(15:0)" />
            <blockpin signalname="XLXN_7(15:0)" name="addr(15:0)" />
            <blockpin signalname="XLXN_28(15:0)" name="outdata(15:0)" />
        </block>
        <block symbolname="controller" name="XLXI_23">
            <blockpin signalname="XLXN_29(15:0)" name="instruction(15:0)" />
            <blockpin signalname="XLXN_31" name="jr_or_not" />
            <blockpin signalname="XLXN_32" name="b_inst" />
            <blockpin signalname="XLXN_33" name="b_eq_ne" />
            <blockpin name="wb_ctrl" />
            <blockpin name="mem_ctrl" />
            <blockpin name="ex_ctrl" />
            <blockpin name="immd(15:0)" />
            <blockpin name="reg_wb_type(1:0)" />
            <blockpin name="reg_r1(3:0)" />
            <blockpin name="reg_r2(3:0)" />
        </block>
        <block symbolname="mux3_pc" name="XLXI_24">
            <blockpin signalname="XLXN_30" name="b_or_not" />
            <blockpin signalname="XLXN_31" name="jr_or_not" />
            <blockpin signalname="XLXN_22(15:0)" name="pc_add_1(15:0)" />
            <blockpin signalname="XLXN_36(15:0)" name="pc_add_n(15:0)" />
            <blockpin name="pc_from_reg(15:0)" />
            <blockpin signalname="XLXN_35(15:0)" name="out_next_pc(15:0)" />
        </block>
        <block symbolname="and_xor_equal" name="XLXI_25">
            <blockpin name="reg1" />
            <blockpin name="reg2" />
            <blockpin signalname="XLXN_32" name="b_inst" />
            <blockpin signalname="XLXN_33" name="b_eq_ne" />
            <blockpin signalname="XLXN_30" name="out_and_gate" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="16000" height="16000">
        <instance x="11568" y="8448" name="XLXI_6" orien="R0">
        </instance>
        <instance x="10160" y="8288" name="XLXI_16" orien="R0">
        </instance>
        <instance x="9104" y="7904" name="XLXI_14" orien="R0">
        </instance>
        <instance x="9104" y="8752" name="XLXI_15" orien="R0">
        </instance>
        <instance x="7296" y="8608" name="XLXI_4" orien="R0">
        </instance>
        <instance x="6080" y="8528" name="XLXI_13" orien="R0">
        </instance>
        <instance x="5632" y="7248" name="XLXI_12" orien="R0">
        </instance>
        <instance x="4368" y="8304" name="XLXI_3" orien="R0">
        </instance>
        <instance x="3040" y="8336" name="XLXI_10" orien="R0">
        </instance>
        <instance x="1904" y="7728" name="XLXI_8" orien="R0">
        </instance>
        <instance x="1008" y="8304" name="XLXI_7" orien="R0">
        </instance>
        <instance x="12928" y="8464" name="XLXI_18" orien="R0">
        </instance>
        <instance x="14112" y="8400" name="XLXI_5" orien="R0">
        </instance>
        <instance x="15024" y="8320" name="XLXI_19" orien="R0">
        </instance>
        <instance x="10864" y="7792" name="XLXI_20" orien="R0">
        </instance>
        <instance x="9584" y="9392" name="XLXI_21" orien="R0">
        </instance>
        <branch name="XLXN_2(15:0)">
            <wire x2="14832" y1="8240" y2="8240" x1="14656" />
            <wire x2="14832" y1="8224" y2="8240" x1="14832" />
            <wire x2="15024" y1="8224" y2="8224" x1="14832" />
        </branch>
        <branch name="XLXN_3(15:0)">
            <wire x2="14832" y1="8176" y2="8176" x1="14656" />
            <wire x2="14832" y1="8160" y2="8176" x1="14832" />
            <wire x2="15024" y1="8160" y2="8160" x1="14832" />
        </branch>
        <branch name="XLXN_4(15:0)">
            <wire x2="14832" y1="8304" y2="8304" x1="14656" />
            <wire x2="14832" y1="8288" y2="8304" x1="14832" />
            <wire x2="15024" y1="8288" y2="8288" x1="14832" />
        </branch>
        <branch name="XLXN_5(15:0)">
            <wire x2="13824" y1="8304" y2="8304" x1="13536" />
            <wire x2="13824" y1="8240" y2="8304" x1="13824" />
            <wire x2="14112" y1="8240" y2="8240" x1="13824" />
        </branch>
        <branch name="XLXN_6(1:0)">
            <wire x2="12560" y1="8288" y2="8288" x1="12208" />
            <wire x2="12560" y1="8240" y2="8288" x1="12560" />
            <wire x2="12928" y1="8240" y2="8240" x1="12560" />
        </branch>
        <branch name="XLXN_7(15:0)">
            <wire x2="1888" y1="7536" y2="9200" x1="1888" />
            <wire x2="2016" y1="9200" y2="9200" x1="1888" />
            <wire x2="12384" y1="7536" y2="7536" x1="1888" />
            <wire x2="12384" y1="7536" y2="8032" x1="12384" />
            <wire x2="12544" y1="8032" y2="8032" x1="12384" />
            <wire x2="12544" y1="8032" y2="8304" x1="12544" />
            <wire x2="12928" y1="8304" y2="8304" x1="12544" />
            <wire x2="12384" y1="8032" y2="8032" x1="12208" />
            <wire x2="12544" y1="7920" y2="8032" x1="12544" />
            <wire x2="13584" y1="7920" y2="7920" x1="12544" />
            <wire x2="13584" y1="7920" y2="8176" x1="13584" />
            <wire x2="14112" y1="8176" y2="8176" x1="13584" />
        </branch>
        <branch name="XLXN_8(15:0)">
            <wire x2="3040" y1="8272" y2="8272" x1="2960" />
            <wire x2="2960" y1="8272" y2="8832" x1="2960" />
            <wire x2="12384" y1="8832" y2="8832" x1="2960" />
            <wire x2="12384" y1="8096" y2="8096" x1="12208" />
            <wire x2="12528" y1="8096" y2="8096" x1="12384" />
            <wire x2="12528" y1="8096" y2="8368" x1="12528" />
            <wire x2="12928" y1="8368" y2="8368" x1="12528" />
            <wire x2="12384" y1="8096" y2="8832" x1="12384" />
        </branch>
        <branch name="XLXN_9(15:0)">
            <wire x2="12272" y1="8160" y2="8160" x1="12208" />
            <wire x2="12272" y1="8160" y2="8528" x1="12272" />
            <wire x2="13904" y1="8528" y2="8528" x1="12272" />
            <wire x2="13904" y1="8304" y2="8528" x1="13904" />
            <wire x2="14112" y1="8304" y2="8304" x1="13904" />
        </branch>
        <branch name="XLXN_10(3:0)">
            <wire x2="12288" y1="8224" y2="8224" x1="12208" />
            <wire x2="12288" y1="8224" y2="8512" x1="12288" />
            <wire x2="13600" y1="8512" y2="8512" x1="12288" />
            <wire x2="13600" y1="8368" y2="8512" x1="13600" />
            <wire x2="14112" y1="8368" y2="8368" x1="13600" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="12272" y1="7968" y2="7968" x1="12208" />
            <wire x2="12272" y1="7872" y2="7968" x1="12272" />
            <wire x2="13600" y1="7872" y2="7872" x1="12272" />
            <wire x2="13600" y1="7872" y2="8112" x1="13600" />
            <wire x2="14112" y1="8112" y2="8112" x1="13600" />
        </branch>
        <branch name="XLXN_12(15:0)">
            <wire x2="10800" y1="8128" y2="8128" x1="10592" />
            <wire x2="11072" y1="8128" y2="8128" x1="10800" />
            <wire x2="11072" y1="8128" y2="8224" x1="11072" />
            <wire x2="11568" y1="8224" y2="8224" x1="11072" />
            <wire x2="10864" y1="7760" y2="7760" x1="10800" />
            <wire x2="10800" y1="7760" y2="8128" x1="10800" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="14832" y1="8048" y2="8048" x1="14656" />
            <wire x2="14832" y1="8048" y2="8096" x1="14832" />
            <wire x2="15024" y1="8096" y2="8096" x1="14832" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="11408" y1="7760" y2="7760" x1="11248" />
            <wire x2="11408" y1="7760" y2="8160" x1="11408" />
            <wire x2="11568" y1="8160" y2="8160" x1="11408" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="7936" y1="7744" y2="7744" x1="7872" />
            <wire x2="7936" y1="7744" y2="7984" x1="7936" />
            <wire x2="10672" y1="7984" y2="7984" x1="7936" />
            <wire x2="10672" y1="7984" y2="8096" x1="10672" />
            <wire x2="11568" y1="8096" y2="8096" x1="10672" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="7920" y1="7680" y2="7680" x1="7872" />
            <wire x2="7920" y1="7680" y2="8032" x1="7920" />
            <wire x2="11568" y1="8032" y2="8032" x1="7920" />
        </branch>
        <branch name="XLXN_18(15:0)">
            <wire x2="1680" y1="8080" y2="8080" x1="1456" />
            <wire x2="1680" y1="8080" y2="8416" x1="1680" />
            <wire x2="3696" y1="8416" y2="8416" x1="1680" />
            <wire x2="1840" y1="8080" y2="8080" x1="1680" />
            <wire x2="1840" y1="8080" y2="9136" x1="1840" />
            <wire x2="2016" y1="9136" y2="9136" x1="1840" />
            <wire x2="1680" y1="7696" y2="8080" x1="1680" />
            <wire x2="1904" y1="7696" y2="7696" x1="1680" />
            <wire x2="3696" y1="8144" y2="8416" x1="3696" />
            <wire x2="4368" y1="8144" y2="8144" x1="3696" />
        </branch>
        <branch name="XLXN_20(1:0)">
            <wire x2="1760" y1="7616" y2="9072" x1="1760" />
            <wire x2="2016" y1="9072" y2="9072" x1="1760" />
            <wire x2="12256" y1="7616" y2="7616" x1="1760" />
            <wire x2="12256" y1="7616" y2="8352" x1="12256" />
            <wire x2="12256" y1="8352" y2="8816" x1="12256" />
            <wire x2="3040" y1="8080" y2="8080" x1="3024" />
            <wire x2="3024" y1="8080" y2="8816" x1="3024" />
            <wire x2="12256" y1="8816" y2="8816" x1="3024" />
            <wire x2="12256" y1="8352" y2="8352" x1="12208" />
        </branch>
        <branch name="XLXN_21(15:0)">
            <wire x2="4000" y1="8176" y2="8176" x1="3648" />
            <wire x2="4000" y1="8176" y2="8272" x1="4000" />
            <wire x2="4368" y1="8272" y2="8272" x1="4000" />
        </branch>
        <branch name="XLXN_22(15:0)">
            <wire x2="2400" y1="6928" y2="6928" x1="2336" />
            <wire x2="2336" y1="6928" y2="7168" x1="2336" />
            <wire x2="2528" y1="7168" y2="7168" x1="2336" />
            <wire x2="2528" y1="7168" y2="7696" x1="2528" />
            <wire x2="3712" y1="7696" y2="7696" x1="2528" />
            <wire x2="3712" y1="7696" y2="8208" x1="3712" />
            <wire x2="4368" y1="8208" y2="8208" x1="3712" />
            <wire x2="2528" y1="7696" y2="7696" x1="2432" />
        </branch>
        <branch name="XLXN_23(15:0)">
            <wire x2="5264" y1="8144" y2="8144" x1="4896" />
            <wire x2="5264" y1="7152" y2="8144" x1="5264" />
            <wire x2="5632" y1="7152" y2="7152" x1="5264" />
        </branch>
        <branch name="XLXN_24(15:0)">
            <wire x2="4944" y1="8016" y2="8016" x1="4896" />
            <wire x2="4944" y1="8016" y2="8592" x1="4944" />
            <wire x2="6608" y1="8592" y2="8592" x1="4944" />
            <wire x2="6608" y1="8128" y2="8592" x1="6608" />
            <wire x2="7296" y1="8128" y2="8128" x1="6608" />
        </branch>
        <branch name="XLXN_25(15:0)">
            <wire x2="9712" y1="8256" y2="8256" x1="7872" />
            <wire x2="9712" y1="8256" y2="8352" x1="9712" />
            <wire x2="11568" y1="8352" y2="8352" x1="9712" />
        </branch>
        <instance x="2016" y="9232" name="XLXI_22" orien="R0">
        </instance>
        <branch name="XLXN_28(15:0)">
            <wire x2="2720" y1="9072" y2="9072" x1="2400" />
            <wire x2="2720" y1="8176" y2="9072" x1="2720" />
            <wire x2="3040" y1="8176" y2="8176" x1="2720" />
        </branch>
        <instance x="6176" y="6640" name="XLXI_23" orien="R0">
        </instance>
        <branch name="XLXN_29(15:0)">
            <wire x2="5536" y1="8272" y2="8272" x1="4896" />
            <wire x2="5536" y1="6032" y2="8272" x1="5536" />
            <wire x2="6176" y1="6032" y2="6032" x1="5536" />
        </branch>
        <instance x="2400" y="7088" name="XLXI_24" orien="R0">
        </instance>
        <instance x="3648" y="6480" name="XLXI_25" orien="R0">
        </instance>
        <branch name="XLXN_30">
            <wire x2="2400" y1="6800" y2="6800" x1="2320" />
            <wire x2="2320" y1="6800" y2="7152" x1="2320" />
            <wire x2="4112" y1="7152" y2="7152" x1="2320" />
            <wire x2="4112" y1="6256" y2="6256" x1="4032" />
            <wire x2="4112" y1="6256" y2="7152" x1="4112" />
        </branch>
        <branch name="XLXN_31">
            <wire x2="2336" y1="6688" y2="6864" x1="2336" />
            <wire x2="2400" y1="6864" y2="6864" x1="2336" />
            <wire x2="6752" y1="6688" y2="6688" x1="2336" />
            <wire x2="6752" y1="6032" y2="6032" x1="6672" />
            <wire x2="6752" y1="6032" y2="6688" x1="6752" />
        </branch>
        <branch name="XLXN_32">
            <wire x2="3600" y1="5936" y2="6384" x1="3600" />
            <wire x2="3648" y1="6384" y2="6384" x1="3600" />
            <wire x2="6736" y1="5936" y2="5936" x1="3600" />
            <wire x2="6736" y1="5936" y2="6096" x1="6736" />
            <wire x2="6736" y1="6096" y2="6096" x1="6672" />
        </branch>
        <branch name="XLXN_33">
            <wire x2="3648" y1="6448" y2="6448" x1="3568" />
            <wire x2="3568" y1="6448" y2="6704" x1="3568" />
            <wire x2="6736" y1="6704" y2="6704" x1="3568" />
            <wire x2="6736" y1="6160" y2="6160" x1="6672" />
            <wire x2="6736" y1="6160" y2="6704" x1="6736" />
        </branch>
        <branch name="XLXN_35(15:0)">
            <wire x2="1008" y1="8272" y2="8272" x1="928" />
            <wire x2="928" y1="8272" y2="8336" x1="928" />
            <wire x2="2992" y1="8336" y2="8336" x1="928" />
            <wire x2="2992" y1="6800" y2="6800" x1="2912" />
            <wire x2="2992" y1="6800" y2="8336" x1="2992" />
        </branch>
        <branch name="XLXN_36(15:0)">
            <wire x2="2400" y1="6992" y2="6992" x1="2352" />
            <wire x2="2352" y1="6992" y2="7104" x1="2352" />
            <wire x2="6112" y1="7104" y2="7104" x1="2352" />
            <wire x2="6112" y1="7104" y2="7152" x1="6112" />
            <wire x2="6112" y1="7152" y2="7152" x1="6048" />
        </branch>
    </sheet>
</drawing>