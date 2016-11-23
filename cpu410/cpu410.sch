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
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_35(15:0)" />
        <signal name="XLXN_36(15:0)" />
        <signal name="XLXN_38(15:0)" />
        <signal name="XLXN_42" />
        <signal name="XLXN_43" />
        <signal name="XLXN_45" />
        <signal name="XLXN_47" />
        <signal name="XLXN_48" />
        <signal name="XLXN_54" />
        <signal name="XLXN_56" />
        <signal name="XLXN_58" />
        <signal name="XLXN_59" />
        <signal name="XLXN_60" />
        <signal name="XLXN_61(1:0)" />
        <signal name="XLXN_62(1:0)" />
        <signal name="XLXN_63(15:0)" />
        <signal name="XLXN_64(15:0)" />
        <signal name="XLXN_65(15:0)" />
        <signal name="XLXN_68(3:0)" />
        <signal name="XLXN_69(3:0)" />
        <signal name="XLXN_70(4:0)" />
        <signal name="XLXN_71(15:0)" />
        <signal name="XLXN_72(15:0)" />
        <signal name="XLXN_73(15:0)" />
        <signal name="XLXN_74" />
        <signal name="XLXN_75(15:0)" />
        <signal name="XLXN_76(15:0)" />
        <signal name="XLXN_77(15:0)" />
        <signal name="XLXN_81(3:0)" />
        <signal name="XLXN_82(1:0)" />
        <signal name="XLXN_83(1:0)" />
        <signal name="XLXN_84(1:0)" />
        <signal name="XLXN_85(11:0)" />
        <signal name="XLXN_88(15:0)" />
        <signal name="XLXN_90" />
        <signal name="XLXN_98" />
        <signal name="XLXN_99(15:0)" />
        <signal name="XLXN_100(3:0)" />
        <blockdef name="alu">
            <timestamp>2016-11-23T16:55:41</timestamp>
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
            <timestamp>2016-11-23T8:23:57</timestamp>
            <rect width="288" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="352" y="-108" height="24" />
            <line x2="416" y1="-96" y2="-96" x1="352" />
        </blockdef>
        <blockdef name="if_id_latch">
            <timestamp>2016-11-23T16:56:5</timestamp>
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
            <timestamp>2016-11-23T16:56:11</timestamp>
            <rect width="448" x="64" y="-640" height="640" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-528" y2="-528" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-220" height="24" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="576" y1="-608" y2="-608" x1="512" />
            <line x2="576" y1="-544" y2="-544" x1="512" />
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
            <timestamp>2016-11-23T16:56:17</timestamp>
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
            <timestamp>2016-11-23T16:56:24</timestamp>
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
            <timestamp>2016-11-23T16:56:30</timestamp>
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
            <timestamp>2016-11-23T16:56:35</timestamp>
            <rect width="400" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <blockdef name="inst_ram">
            <timestamp>2016-11-23T16:56:41</timestamp>
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
            <timestamp>2016-11-23T16:56:47</timestamp>
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
            <timestamp>2016-11-23T16:56:54</timestamp>
            <rect width="336" x="64" y="-448" height="448" />
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
            <rect width="64" x="400" y="-428" height="24" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <blockdef name="mem_ctrl">
            <timestamp>2016-11-23T16:57:0</timestamp>
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
            <timestamp>2016-11-23T16:57:7</timestamp>
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
            <timestamp>2016-11-23T16:57:13</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="mux2_pc_inst">
            <timestamp>2016-11-23T16:57:18</timestamp>
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
            <timestamp>2016-11-23T16:57:24</timestamp>
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
            <timestamp>2016-11-23T16:57:30</timestamp>
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
            <timestamp>2016-11-23T16:57:36</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
        </blockdef>
        <blockdef name="ctrl_mux">
            <timestamp>2016-11-23T16:57:42</timestamp>
            <rect width="384" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="512" y1="-288" y2="-288" x1="448" />
            <line x2="512" y1="-160" y2="-160" x1="448" />
            <line x2="512" y1="-32" y2="-32" x1="448" />
        </blockdef>
        <blockdef name="pause_pipeline">
            <timestamp>2016-11-23T16:57:47</timestamp>
            <rect width="400" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <line x2="528" y1="-96" y2="-96" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <blockdef name="mux2">
            <timestamp>2016-11-23T16:57:53</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="forward">
            <timestamp>2016-11-23T16:57:59</timestamp>
            <rect width="400" x="64" y="-384" height="384" />
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
            <rect width="64" x="464" y="-364" height="24" />
            <line x2="528" y1="-352" y2="-352" x1="464" />
            <rect width="64" x="464" y="-204" height="24" />
            <line x2="528" y1="-192" y2="-192" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <block symbolname="if_id_latch" name="XLXI_3">
            <blockpin name="clk" />
            <blockpin signalname="XLXN_58" name="pause" />
            <blockpin signalname="XLXN_18(15:0)" name="in_pc(15:0)" />
            <blockpin signalname="XLXN_22(15:0)" name="in_pc_plus1(15:0)" />
            <blockpin signalname="XLXN_21(15:0)" name="in_inst(15:0)" />
            <blockpin signalname="XLXN_24(15:0)" name="out_pc(15:0)" />
            <blockpin signalname="XLXN_23(15:0)" name="out_pc_plus1(15:0)" />
            <blockpin signalname="XLXN_29(15:0)" name="out_inst(15:0)" />
        </block>
        <block symbolname="id_ex_latch" name="XLXI_4">
            <blockpin signalname="XLXN_63(15:0)" name="clk" />
            <blockpin name="in_wb" />
            <blockpin name="in_mem" />
            <blockpin name="in_ex" />
            <blockpin name="in_Rx_val(15:0)" />
            <blockpin name="in_Ry_val(15:0)" />
            <blockpin name="in_imme(15:0)" />
            <blockpin name="in_pc(15:0)" />
            <blockpin signalname="XLXN_70(4:0)" name="out_wb_ctrl" />
            <blockpin signalname="XLXN_71(15:0)" name="out_mem_ctrl" />
            <blockpin signalname="XLXN_72(15:0)" name="out_alu1_ri_choose" />
            <blockpin signalname="XLXN_73(15:0)" name="out_pause(1:0)" />
            <blockpin signalname="XLXN_25(15:0)" name="out_reg_num_choose(3:0)" />
            <blockpin name="out_alu_op(4:0)" />
            <blockpin name="out_Rx_val(15:0)" />
            <blockpin name="out_Ry_val(15:0)" />
            <blockpin name="out_imme(15:0)" />
            <blockpin name="out_pc(15:0)" />
        </block>
        <block symbolname="mem_wb_latch" name="XLXI_5">
            <blockpin name="CLK" />
            <blockpin signalname="XLXN_11" name="IN_WB_CONTROL" />
            <blockpin signalname="XLXN_88(15:0)" name="IN_ADDR(15:0)" />
            <blockpin signalname="XLXN_5(15:0)" name="IN_DATA(15:0)" />
            <blockpin signalname="XLXN_9(15:0)" name="IN_PC(15:0)" />
            <blockpin signalname="XLXN_10(3:0)" name="IN_REG_NO(3:0)" />
            <blockpin signalname="XLXN_14" name="OUT_WB_CHOOSE" />
            <blockpin signalname="XLXN_98" name="OUT_REG_WN" />
            <blockpin signalname="XLXN_3(15:0)" name="OUT_ADDR(15:0)" />
            <blockpin signalname="XLXN_2(15:0)" name="OUT_DATA(15:0)" />
            <blockpin signalname="XLXN_4(15:0)" name="OUT_PC(15:0)" />
            <blockpin signalname="XLXN_100(3:0)" name="OUT_REG_NO(3:0)" />
        </block>
        <block symbolname="ex_mem_latch" name="XLXI_6">
            <blockpin signalname="XLXN_90" name="CLK" />
            <blockpin signalname="XLXN_17" name="IN_WB_CTRL" />
            <blockpin signalname="XLXN_16" name="IN_MEM_CTRL" />
            <blockpin signalname="XLXN_15" name="IN_CMP_RS" />
            <blockpin signalname="XLXN_12(15:0)" name="IN_ADDR(15:0)" />
            <blockpin signalname="XLXN_72(15:0)" name="IN_DATA(15:0)" />
            <blockpin signalname="XLXN_25(15:0)" name="IN_PC(15:0)" />
            <blockpin signalname="XLXN_81(3:0)" name="IN_REG_NO(3:0)" />
            <blockpin signalname="XLXN_11" name="OUT_WB_CONTROL" />
            <blockpin signalname="XLXN_88(15:0)" name="OUT_ADDR(15:0)" />
            <blockpin signalname="XLXN_8(15:0)" name="OUT_DATA(15:0)" />
            <blockpin signalname="XLXN_9(15:0)" name="OUT_PC(15:0)" />
            <blockpin signalname="XLXN_10(3:0)" name="OUT_REG_NO(3:0)" />
            <blockpin signalname="XLXN_6(1:0)" name="OUT_RAM1_READ_WRITE(1:0)" />
            <blockpin signalname="XLXN_20(1:0)" name="OUT_RAM2_READ_WRITE(1:0)" />
        </block>
        <block symbolname="pc_reg" name="XLXI_7">
            <blockpin name="rst" />
            <blockpin name="clk" />
            <blockpin signalname="XLXN_59" name="pc_pause" />
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
            <blockpin signalname="XLXN_38(15:0)" name="imm(15:0)" />
            <blockpin signalname="XLXN_36(15:0)" name="pc_new(15:0)" />
        </block>
        <block symbolname="registers" name="XLXI_13">
            <blockpin name="clk" />
            <blockpin name="rst" />
            <blockpin signalname="XLXN_98" name="write_en" />
            <blockpin signalname="XLXN_68(3:0)" name="r1_addr(3:0)" />
            <blockpin signalname="XLXN_69(3:0)" name="r2_addr(3:0)" />
            <blockpin signalname="XLXN_100(3:0)" name="write_addr(3:0)" />
            <blockpin signalname="XLXN_99(15:0)" name="write_data(15:0)" />
            <blockpin signalname="XLXN_64(15:0)" name="r1_data(15:0)" />
            <blockpin signalname="XLXN_63(15:0)" name="r2_data(15:0)" />
        </block>
        <block symbolname="mux3" name="XLXI_14">
            <blockpin signalname="XLXN_71(15:0)" name="data1(15:0)" />
            <blockpin signalname="XLXN_88(15:0)" name="data2(15:0)" />
            <blockpin signalname="XLXN_99(15:0)" name="data3(15:0)" />
            <blockpin signalname="XLXN_82(1:0)" name="choose(1:0)" />
            <blockpin signalname="XLXN_76(15:0)" name="outdata(15:0)" />
        </block>
        <block symbolname="mux3" name="XLXI_15">
            <blockpin signalname="XLXN_88(15:0)" name="data1(15:0)" />
            <blockpin signalname="XLXN_75(15:0)" name="data2(15:0)" />
            <blockpin signalname="XLXN_99(15:0)" name="data3(15:0)" />
            <blockpin signalname="XLXN_83(1:0)" name="choose(1:0)" />
            <blockpin signalname="XLXN_77(15:0)" name="outdata(15:0)" />
        </block>
        <block symbolname="alu" name="XLXI_16">
            <blockpin signalname="XLXN_76(15:0)" name="alu_op1(15:0)" />
            <blockpin signalname="XLXN_77(15:0)" name="alu_op2(15:0)" />
            <blockpin signalname="XLXN_70(4:0)" name="alu_inst(4:0)" />
            <blockpin signalname="XLXN_12(15:0)" name="alu_res(15:0)" />
        </block>
        <block symbolname="mem_ctrl" name="XLXI_18">
            <blockpin name="CLK" />
            <blockpin name="data_ready" />
            <blockpin name="tbre" />
            <blockpin name="tsre" />
            <blockpin signalname="XLXN_6(1:0)" name="RAM_READ_WRITE(1:0)" />
            <blockpin signalname="XLXN_88(15:0)" name="RAM_ADDR(15:0)" />
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
            <blockpin signalname="XLXN_99(15:0)" name="OUT_WB_DATA(15:0)" />
        </block>
        <block symbolname="cmp8k" name="XLXI_20">
            <blockpin signalname="XLXN_12(15:0)" name="data_in(15:0)" />
            <blockpin signalname="XLXN_15" name="res" />
        </block>
        <block symbolname="mux2_pc_inst" name="XLXI_22">
            <blockpin signalname="XLXN_20(1:0)" name="choose(1:0)" />
            <blockpin signalname="XLXN_18(15:0)" name="pc(15:0)" />
            <blockpin signalname="XLXN_88(15:0)" name="addr(15:0)" />
            <blockpin signalname="XLXN_28(15:0)" name="outdata(15:0)" />
        </block>
        <block symbolname="controller" name="XLXI_23">
            <blockpin signalname="XLXN_29(15:0)" name="instruction(15:0)" />
            <blockpin signalname="XLXN_31" name="jr_or_not" />
            <blockpin signalname="XLXN_32" name="b_inst" />
            <blockpin signalname="XLXN_54" name="b_eq_ne" />
            <blockpin signalname="XLXN_42" name="wb_ctrl" />
            <blockpin signalname="XLXN_42" name="mem_ctrl" />
            <blockpin signalname="XLXN_43" name="ex_ctrl" />
            <blockpin signalname="XLXN_38(15:0)" name="immd(15:0)" />
            <blockpin signalname="XLXN_61(1:0)" name="reg_wb_type(1:0)" />
            <blockpin signalname="XLXN_68(3:0)" name="reg_r1(3:0)" />
            <blockpin signalname="XLXN_69(3:0)" name="reg_r2(3:0)" />
        </block>
        <block symbolname="mux3_pc" name="XLXI_24">
            <blockpin signalname="XLXN_56" name="b_or_not" />
            <blockpin signalname="XLXN_31" name="jr_or_not" />
            <blockpin signalname="XLXN_22(15:0)" name="pc_add_1(15:0)" />
            <blockpin signalname="XLXN_36(15:0)" name="pc_add_n(15:0)" />
            <blockpin signalname="XLXN_65(15:0)" name="pc_from_reg(15:0)" />
            <blockpin signalname="XLXN_35(15:0)" name="out_next_pc(15:0)" />
        </block>
        <block symbolname="and_xor_equal" name="XLXI_25">
            <blockpin name="b_inst" />
            <blockpin name="b_eq_ne" />
            <blockpin signalname="XLXN_32" name="reg1(15:0)" />
            <blockpin signalname="XLXN_54" name="reg2(15:0)" />
            <blockpin signalname="XLXN_56" name="out_and_gate" />
        </block>
        <block symbolname="ctrl_mux" name="XLXI_27">
            <blockpin name="in_wb_ctrl" />
            <blockpin signalname="XLXN_42" name="in_mem_ctrl" />
            <blockpin signalname="XLXN_42" name="in_ex_ctrl" />
            <blockpin signalname="XLXN_43" name="pause_or_not" />
            <blockpin signalname="XLXN_48" name="in_reg_wb_type(1:0)" />
            <blockpin name="out_wb_ctrl" />
            <blockpin name="out_ex_ctrl" />
            <blockpin signalname="XLXN_45" name="out_latch_mem" />
        </block>
        <block symbolname="pause_pipeline" name="XLXI_28">
            <blockpin name="clk" />
            <blockpin name="prev_reg(3:0)" />
            <blockpin name="instr(15:0)" />
            <blockpin name="prev_reg_type(1:0)" />
            <blockpin signalname="XLXN_59" name="latch_1_pause_ctrl" />
            <blockpin signalname="XLXN_48" name="pc_pause_ctrl" />
            <blockpin signalname="XLXN_85(11:0)" name="ctrl_choose" />
            <blockpin name="reg_bus(11:0)" />
        </block>
        <block symbolname="mux3" name="XLXI_29">
            <blockpin signalname="XLXN_88(15:0)" name="data1(15:0)" />
            <blockpin signalname="XLXN_64(15:0)" name="data2(15:0)" />
            <blockpin signalname="XLXN_99(15:0)" name="data3(15:0)" />
            <blockpin signalname="XLXN_84(1:0)" name="choose(1:0)" />
            <blockpin signalname="XLXN_65(15:0)" name="outdata(15:0)" />
        </block>
        <block symbolname="mux2" name="XLXI_30">
            <blockpin signalname="XLXN_74" name="choose" />
            <blockpin signalname="XLXN_72(15:0)" name="data1(15:0)" />
            <blockpin signalname="XLXN_73(15:0)" name="data2(15:0)" />
            <blockpin signalname="XLXN_75(15:0)" name="outdata(15:0)" />
        </block>
        <block symbolname="forward" name="XLXI_31">
            <blockpin signalname="XLXN_25(15:0)" name="clk" />
            <blockpin signalname="XLXN_85(11:0)" name="reg_bus(11:0)" />
            <blockpin signalname="XLXN_81(3:0)" name="reg_prev(3:0)" />
            <blockpin name="reg_prev1(3:0)" />
            <blockpin name="reg_prev2(3:0)" />
            <blockpin name="reg_prev_type(1:0)" />
            <blockpin signalname="XLXN_25(15:0)" name="alu_choose1(1:0)" />
            <blockpin name="alu_choose2(1:0)" />
            <blockpin signalname="XLXN_84(1:0)" name="reg_choose1(1:0)" />
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
        <instance x="5632" y="7248" name="XLXI_12" orien="R0" />
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
            <wire x2="10160" y1="8352" y2="8352" x1="9712" />
            <wire x2="10688" y1="8352" y2="8352" x1="10160" />
            <wire x2="11568" y1="8352" y2="8352" x1="10688" />
        </branch>
        <instance x="2016" y="9232" name="XLXI_22" orien="R0">
        </instance>
        <branch name="XLXN_28(15:0)">
            <wire x2="2720" y1="9072" y2="9072" x1="2400" />
            <wire x2="2720" y1="8176" y2="9072" x1="2720" />
            <wire x2="3040" y1="8176" y2="8176" x1="2720" />
        </branch>
        <instance x="2400" y="7088" name="XLXI_24" orien="R0">
        </instance>
        <branch name="XLXN_31">
            <wire x2="2400" y1="6864" y2="6864" x1="2384" />
            <wire x2="2384" y1="6864" y2="7312" x1="2384" />
            <wire x2="6752" y1="7312" y2="7312" x1="2384" />
            <wire x2="6752" y1="6032" y2="6032" x1="6672" />
            <wire x2="6752" y1="6032" y2="7312" x1="6752" />
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
        <instance x="3888" y="6480" name="XLXI_25" orien="R0">
        </instance>
        <branch name="XLXN_32">
            <wire x2="3808" y1="5936" y2="6384" x1="3808" />
            <wire x2="3872" y1="6384" y2="6384" x1="3808" />
            <wire x2="3888" y1="6384" y2="6384" x1="3872" />
            <wire x2="6688" y1="5936" y2="5936" x1="3808" />
            <wire x2="6688" y1="5936" y2="6096" x1="6688" />
            <wire x2="6688" y1="6096" y2="6096" x1="6672" />
        </branch>
        <branch name="XLXN_29(15:0)">
            <wire x2="4912" y1="8272" y2="8272" x1="4896" />
            <wire x2="5536" y1="8272" y2="8272" x1="4912" />
            <wire x2="6144" y1="5584" y2="5584" x1="5536" />
            <wire x2="5536" y1="5584" y2="6032" x1="5536" />
            <wire x2="5536" y1="6032" y2="8272" x1="5536" />
            <wire x2="6176" y1="6032" y2="6032" x1="5536" />
        </branch>
        <instance x="6176" y="6640" name="XLXI_23" orien="R0">
        </instance>
        <branch name="XLXN_38(15:0)">
            <wire x2="5600" y1="7008" y2="7216" x1="5600" />
            <wire x2="5632" y1="7216" y2="7216" x1="5600" />
            <wire x2="6544" y1="7008" y2="7008" x1="5600" />
            <wire x2="6560" y1="7008" y2="7008" x1="6544" />
            <wire x2="6624" y1="7008" y2="7008" x1="6560" />
            <wire x2="6704" y1="7008" y2="7008" x1="6624" />
            <wire x2="6544" y1="7008" y2="8064" x1="6544" />
            <wire x2="7296" y1="8064" y2="8064" x1="6544" />
            <wire x2="6704" y1="6416" y2="6416" x1="6672" />
            <wire x2="6704" y1="6416" y2="7008" x1="6704" />
        </branch>
        <branch name="XLXN_42">
            <wire x2="6688" y1="6224" y2="6224" x1="6672" />
            <wire x2="6912" y1="6224" y2="6224" x1="6688" />
        </branch>
        <branch name="XLXN_42">
            <wire x2="6688" y1="6288" y2="6288" x1="6672" />
            <wire x2="6912" y1="6288" y2="6288" x1="6688" />
        </branch>
        <branch name="XLXN_43">
            <wire x2="6688" y1="6352" y2="6352" x1="6672" />
            <wire x2="6912" y1="6352" y2="6352" x1="6688" />
        </branch>
        <instance x="6912" y="6448" name="XLXI_27" orien="R0">
        </instance>
        <branch name="XLXN_45">
            <wire x2="7296" y1="7872" y2="7872" x1="7216" />
            <wire x2="7216" y1="7872" y2="8688" x1="7216" />
            <wire x2="7904" y1="8688" y2="8688" x1="7216" />
            <wire x2="7424" y1="6416" y2="6416" x1="7344" />
            <wire x2="7904" y1="6416" y2="6416" x1="7424" />
            <wire x2="7904" y1="6416" y2="8688" x1="7904" />
        </branch>
        <branch name="XLXN_47">
            <wire x2="7296" y1="7744" y2="7744" x1="7248" />
            <wire x2="7248" y1="7744" y2="8656" x1="7248" />
            <wire x2="8000" y1="8656" y2="8656" x1="7248" />
            <wire x2="8000" y1="6224" y2="6224" x1="7344" />
            <wire x2="8000" y1="6224" y2="8656" x1="8000" />
        </branch>
        <branch name="XLXN_48">
            <wire x2="6896" y1="5552" y2="5552" x1="6672" />
            <wire x2="6896" y1="5552" y2="6416" x1="6896" />
            <wire x2="6912" y1="6416" y2="6416" x1="6896" />
        </branch>
        <instance x="6144" y="5712" name="XLXI_28" orien="R0">
        </instance>
        <branch name="XLXN_54">
            <wire x2="3856" y1="5952" y2="6448" x1="3856" />
            <wire x2="3888" y1="6448" y2="6448" x1="3856" />
            <wire x2="6768" y1="5952" y2="5952" x1="3856" />
            <wire x2="6768" y1="5952" y2="6160" x1="6768" />
            <wire x2="6768" y1="6160" y2="6160" x1="6672" />
        </branch>
        <branch name="XLXN_56">
            <wire x2="2400" y1="6800" y2="6800" x1="2368" />
            <wire x2="2368" y1="6800" y2="7152" x1="2368" />
            <wire x2="4352" y1="7152" y2="7152" x1="2368" />
            <wire x2="4352" y1="6256" y2="6256" x1="4272" />
            <wire x2="4352" y1="6256" y2="7152" x1="4352" />
        </branch>
        <branch name="XLXN_58">
            <wire x2="4304" y1="7904" y2="8080" x1="4304" />
            <wire x2="4368" y1="8080" y2="8080" x1="4304" />
            <wire x2="6784" y1="7904" y2="7904" x1="4304" />
            <wire x2="6784" y1="5424" y2="5424" x1="6672" />
            <wire x2="6784" y1="5424" y2="7904" x1="6784" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="1008" y1="8208" y2="8208" x1="944" />
            <wire x2="944" y1="8208" y2="8576" x1="944" />
            <wire x2="6736" y1="8576" y2="8576" x1="944" />
            <wire x2="6736" y1="5488" y2="5488" x1="6672" />
            <wire x2="6736" y1="5488" y2="8576" x1="6736" />
        </branch>
        <branch name="XLXN_60">
            <wire x2="7296" y1="7808" y2="7808" x1="7232" />
            <wire x2="7232" y1="7808" y2="8624" x1="7232" />
            <wire x2="7888" y1="8624" y2="8624" x1="7232" />
            <wire x2="7888" y1="6480" y2="6480" x1="7344" />
            <wire x2="7888" y1="6480" y2="8624" x1="7888" />
        </branch>
        <branch name="XLXN_61(1:0)">
            <wire x2="6896" y1="6480" y2="6480" x1="6672" />
            <wire x2="6912" y1="6480" y2="6480" x1="6896" />
        </branch>
        <branch name="XLXN_62(1:0)">
            <wire x2="6064" y1="5328" y2="5664" x1="6064" />
            <wire x2="6144" y1="5664" y2="5664" x1="6064" />
            <wire x2="8016" y1="5328" y2="5328" x1="6064" />
            <wire x2="8016" y1="5328" y2="7872" x1="8016" />
            <wire x2="8016" y1="7872" y2="7872" x1="7872" />
        </branch>
        <branch name="XLXN_63(15:0)">
            <wire x2="3888" y1="6576" y2="6576" x1="3792" />
            <wire x2="3792" y1="6576" y2="8560" x1="3792" />
            <wire x2="6208" y1="8560" y2="8560" x1="3792" />
            <wire x2="6208" y1="8480" y2="8480" x1="6160" />
            <wire x2="7280" y1="8480" y2="8480" x1="6208" />
            <wire x2="6208" y1="8480" y2="8560" x1="6208" />
            <wire x2="7296" y1="8000" y2="8000" x1="7280" />
            <wire x2="7280" y1="8000" y2="8480" x1="7280" />
        </branch>
        <instance x="5696" y="8512" name="XLXI_13" orien="R0">
        </instance>
        <branch name="XLXN_64(15:0)">
            <wire x2="6176" y1="8096" y2="8096" x1="6160" />
            <wire x2="6176" y1="8096" y2="8176" x1="6176" />
            <wire x2="6224" y1="8176" y2="8176" x1="6176" />
        </branch>
        <branch name="XLXN_65(15:0)">
            <wire x2="2272" y1="6752" y2="7056" x1="2272" />
            <wire x2="2400" y1="7056" y2="7056" x1="2272" />
            <wire x2="6944" y1="6752" y2="6752" x1="2272" />
            <wire x2="6944" y1="6752" y2="7936" x1="6944" />
            <wire x2="7296" y1="7936" y2="7936" x1="6944" />
            <wire x2="6944" y1="7936" y2="8112" x1="6944" />
            <wire x2="3888" y1="6512" y2="6512" x1="3856" />
            <wire x2="3856" y1="6512" y2="7936" x1="3856" />
            <wire x2="6944" y1="7936" y2="7936" x1="3856" />
            <wire x2="6944" y1="8112" y2="8112" x1="6608" />
        </branch>
        <branch name="XLXN_68(3:0)">
            <wire x2="5696" y1="8288" y2="8288" x1="5632" />
            <wire x2="5632" y1="8288" y2="8528" x1="5632" />
            <wire x2="6720" y1="8528" y2="8528" x1="5632" />
            <wire x2="6720" y1="6544" y2="6544" x1="6672" />
            <wire x2="6720" y1="6544" y2="8528" x1="6720" />
        </branch>
        <branch name="XLXN_69(3:0)">
            <wire x2="5696" y1="8352" y2="8352" x1="5680" />
            <wire x2="5680" y1="8352" y2="8656" x1="5680" />
            <wire x2="6688" y1="8656" y2="8656" x1="5680" />
            <wire x2="6688" y1="6608" y2="6608" x1="6672" />
            <wire x2="6688" y1="6608" y2="8656" x1="6688" />
        </branch>
        <branch name="XLXN_70(4:0)">
            <wire x2="9760" y1="8000" y2="8000" x1="7872" />
            <wire x2="9760" y1="8000" y2="8256" x1="9760" />
            <wire x2="10160" y1="8256" y2="8256" x1="9760" />
        </branch>
        <branch name="XLXN_71(15:0)">
            <wire x2="8480" y1="8064" y2="8064" x1="7872" />
            <wire x2="8480" y1="7680" y2="8064" x1="8480" />
            <wire x2="9104" y1="7680" y2="7680" x1="8480" />
        </branch>
        <instance x="8528" y="8688" name="XLXI_30" orien="R0">
        </instance>
        <branch name="XLXN_72(15:0)">
            <wire x2="8192" y1="8128" y2="8128" x1="7872" />
            <wire x2="8192" y1="8128" y2="8592" x1="8192" />
            <wire x2="8528" y1="8592" y2="8592" x1="8192" />
            <wire x2="8192" y1="7952" y2="8128" x1="8192" />
            <wire x2="10656" y1="7952" y2="7952" x1="8192" />
            <wire x2="10656" y1="7952" y2="8288" x1="10656" />
            <wire x2="11568" y1="8288" y2="8288" x1="10656" />
        </branch>
        <branch name="XLXN_73(15:0)">
            <wire x2="8176" y1="8192" y2="8192" x1="7872" />
            <wire x2="8176" y1="8192" y2="8656" x1="8176" />
            <wire x2="8528" y1="8656" y2="8656" x1="8176" />
        </branch>
        <branch name="XLXN_74">
            <wire x2="8160" y1="7808" y2="7808" x1="7872" />
            <wire x2="8160" y1="7808" y2="8528" x1="8160" />
            <wire x2="8528" y1="8528" y2="8528" x1="8160" />
        </branch>
        <branch name="XLXN_75(15:0)">
            <wire x2="9008" y1="8528" y2="8528" x1="8912" />
            <wire x2="9008" y1="8528" y2="8592" x1="9008" />
            <wire x2="9104" y1="8592" y2="8592" x1="9008" />
        </branch>
        <branch name="XLXN_76(15:0)">
            <wire x2="9824" y1="7680" y2="7680" x1="9488" />
            <wire x2="9824" y1="7680" y2="8128" x1="9824" />
            <wire x2="10160" y1="8128" y2="8128" x1="9824" />
        </branch>
        <branch name="XLXN_77(15:0)">
            <wire x2="9824" y1="8528" y2="8528" x1="9488" />
            <wire x2="9824" y1="8192" y2="8528" x1="9824" />
            <wire x2="10160" y1="8192" y2="8192" x1="9824" />
        </branch>
        <instance x="10160" y="8704" name="XLXI_31" orien="R0">
        </instance>
        <branch name="XLXN_81(3:0)">
            <wire x2="6080" y1="5344" y2="5504" x1="6080" />
            <wire x2="6144" y1="5504" y2="5504" x1="6080" />
            <wire x2="7984" y1="5344" y2="5344" x1="6080" />
            <wire x2="7984" y1="5344" y2="7936" x1="7984" />
            <wire x2="7984" y1="7936" y2="8480" x1="7984" />
            <wire x2="10160" y1="8480" y2="8480" x1="7984" />
            <wire x2="10832" y1="7936" y2="7936" x1="7984" />
            <wire x2="10832" y1="7936" y2="8416" x1="10832" />
            <wire x2="11568" y1="8416" y2="8416" x1="10832" />
            <wire x2="7984" y1="7936" y2="7936" x1="7872" />
        </branch>
        <branch name="XLXN_82(1:0)">
            <wire x2="9040" y1="7584" y2="7872" x1="9040" />
            <wire x2="9104" y1="7872" y2="7872" x1="9040" />
            <wire x2="10752" y1="7584" y2="7584" x1="9040" />
            <wire x2="10752" y1="7584" y2="8416" x1="10752" />
            <wire x2="10752" y1="8416" y2="8416" x1="10688" />
        </branch>
        <branch name="XLXN_83(1:0)">
            <wire x2="9104" y1="8720" y2="8720" x1="9040" />
            <wire x2="9040" y1="8720" y2="8800" x1="9040" />
            <wire x2="10768" y1="8800" y2="8800" x1="9040" />
            <wire x2="10768" y1="8544" y2="8544" x1="10688" />
            <wire x2="10768" y1="8544" y2="8800" x1="10768" />
        </branch>
        <branch name="XLXN_84(1:0)">
            <wire x2="6224" y1="8304" y2="8304" x1="6176" />
            <wire x2="6176" y1="8304" y2="8400" x1="6176" />
            <wire x2="6272" y1="8400" y2="8400" x1="6176" />
            <wire x2="6272" y1="8400" y2="8784" x1="6272" />
            <wire x2="10704" y1="8784" y2="8784" x1="6272" />
            <wire x2="10704" y1="8672" y2="8672" x1="10688" />
            <wire x2="10704" y1="8672" y2="8784" x1="10704" />
        </branch>
        <branch name="XLXN_85(11:0)">
            <wire x2="8416" y1="5616" y2="5616" x1="6672" />
            <wire x2="8416" y1="5616" y2="8416" x1="8416" />
            <wire x2="10160" y1="8416" y2="8416" x1="8416" />
        </branch>
        <branch name="XLXN_90">
            <wire x2="11552" y1="7920" y2="7968" x1="11552" />
            <wire x2="11568" y1="7968" y2="7968" x1="11552" />
        </branch>
        <instance x="6224" y="8336" name="XLXI_29" orien="R0">
        </instance>
        <branch name="XLXN_88(15:0)">
            <wire x2="1888" y1="7536" y2="9200" x1="1888" />
            <wire x2="2016" y1="9200" y2="9200" x1="1888" />
            <wire x2="12384" y1="7536" y2="7536" x1="1888" />
            <wire x2="12384" y1="7536" y2="8032" x1="12384" />
            <wire x2="12544" y1="8032" y2="8032" x1="12384" />
            <wire x2="12544" y1="8032" y2="8304" x1="12544" />
            <wire x2="12928" y1="8304" y2="8304" x1="12544" />
            <wire x2="12624" y1="8032" y2="8032" x1="12544" />
            <wire x2="12672" y1="8032" y2="8032" x1="12624" />
            <wire x2="12672" y1="8032" y2="8880" x1="12672" />
            <wire x2="12624" y1="8032" y2="8912" x1="12624" />
            <wire x2="6224" y1="8112" y2="8112" x1="6192" />
            <wire x2="6192" y1="8112" y2="8912" x1="6192" />
            <wire x2="12624" y1="8912" y2="8912" x1="6192" />
            <wire x2="9056" y1="7632" y2="7744" x1="9056" />
            <wire x2="9104" y1="7744" y2="7744" x1="9056" />
            <wire x2="12624" y1="7632" y2="7632" x1="9056" />
            <wire x2="12624" y1="7632" y2="8032" x1="12624" />
            <wire x2="9104" y1="8528" y2="8528" x1="9088" />
            <wire x2="9088" y1="8528" y2="8880" x1="9088" />
            <wire x2="12672" y1="8880" y2="8880" x1="9088" />
            <wire x2="12384" y1="8032" y2="8032" x1="12208" />
            <wire x2="12544" y1="7920" y2="8032" x1="12544" />
            <wire x2="13584" y1="7920" y2="7920" x1="12544" />
            <wire x2="13584" y1="7920" y2="8176" x1="13584" />
            <wire x2="14112" y1="8176" y2="8176" x1="13584" />
        </branch>
        <branch name="XLXN_98">
            <wire x2="5616" y1="7504" y2="8224" x1="5616" />
            <wire x2="5696" y1="8224" y2="8224" x1="5616" />
            <wire x2="14720" y1="7504" y2="7504" x1="5616" />
            <wire x2="14720" y1="7504" y2="8112" x1="14720" />
            <wire x2="14720" y1="8112" y2="8112" x1="14656" />
        </branch>
        <branch name="XLXN_99(15:0)">
            <wire x2="5696" y1="8480" y2="8480" x1="5600" />
            <wire x2="5600" y1="8480" y2="8896" x1="5600" />
            <wire x2="15696" y1="8896" y2="8896" x1="5600" />
            <wire x2="6192" y1="6736" y2="8048" x1="6192" />
            <wire x2="6208" y1="8048" y2="8048" x1="6192" />
            <wire x2="6208" y1="8048" y2="8240" x1="6208" />
            <wire x2="6224" y1="8240" y2="8240" x1="6208" />
            <wire x2="9024" y1="6736" y2="6736" x1="6192" />
            <wire x2="9024" y1="6736" y2="7808" x1="9024" />
            <wire x2="9104" y1="7808" y2="7808" x1="9024" />
            <wire x2="9024" y1="7808" y2="8656" x1="9024" />
            <wire x2="9024" y1="8656" y2="8848" x1="9024" />
            <wire x2="15696" y1="8848" y2="8848" x1="9024" />
            <wire x2="15696" y1="8848" y2="8896" x1="15696" />
            <wire x2="9104" y1="8656" y2="8656" x1="9024" />
            <wire x2="15696" y1="8032" y2="8032" x1="15616" />
            <wire x2="15696" y1="8032" y2="8848" x1="15696" />
        </branch>
        <branch name="XLXN_100(3:0)">
            <wire x2="5664" y1="7552" y2="8416" x1="5664" />
            <wire x2="5696" y1="8416" y2="8416" x1="5664" />
            <wire x2="14704" y1="7552" y2="7552" x1="5664" />
            <wire x2="14704" y1="7552" y2="8368" x1="14704" />
            <wire x2="14704" y1="8368" y2="8368" x1="14656" />
        </branch>
    </sheet>
</drawing>