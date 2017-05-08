// Copyright 2013 Bill Campbell, Swami Iyer and Bahar Akbal-Delibas

package jminusminus;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Implements register allocation using graph coloring algorithm.
 */

public class NGraphRegisterAllocator extends NRegisterAllocator {

    /**
     * Construct a NGraphRegisterAllocator.
     *
     * @param cfg
     *            an instance of a control flow graph.
     */

    public NGraphRegisterAllocator(NControlFlowGraph cfg) {
        super(cfg);
    }

    /**
     * Build intervals with register allocation information in them.
     */

    public void allocation() {
        buildIntervals();

        ArrayList<NInterval> unhandled = new ArrayList<>();
        for (int i = 32; i < cfg.intervals.size(); i++) {
            this.addSortedToUnhandled(cfg.intervals.get(i), unhandled);
        }

        boolean[][] adjacencyGraph = buildInferenceGraph(unhandled);

        ArrayList<NInterval>[] adjancencyList = buildAdjacencyList(adjacencyGraph);


        System.out.println("INTERVALS ARE HERER!!");
        printIntervals(unhandled);


        System.out.println("ADJACENCEY GRAPH !!");
        printIntervals(adjacencyGraph);

        System.out.println("adjancenylist ");
        printIntervals(adjancencyList);


    }

    private void printIntervals(ArrayList<NInterval>[] adjancencyList) {
        System.out.println("array list ");
        for (int i = 0; i < adjancencyList.length; i++) {
            ArrayList<NInterval> eachh = adjancencyList[i];
            System.out.print("for position " + i);
            printIntervals(eachh);
        }
    }

    private ArrayList<NInterval>[] buildAdjacencyList(boolean[][] adjacencyMatrix) {
        ArrayList<NInterval>[] adjacencyList = new ArrayList[adjacencyMatrix.length];
        for(int i = 0; i < adjacencyList.length; i++)
            adjacencyList[i] = new ArrayList<NInterval>();


        for(int i = 0; i < adjacencyMatrix.length; i++){
            for(int j = 0; j < adjacencyMatrix[0].length; j++){
                if(adjacencyMatrix[i][j]){
                    //should get an interval here
                    adjacencyList[i].add(getInterval(j));
                }
            }
        }

        return adjacencyList;

    }

    private NInterval getInterval(int regId) {
        regId = 32 + regId;
        for(NInterval interval : cfg.intervals){
            if(interval.vRegId == regId)
                return interval;
        }
        return null;
    }

    private void printIntervals(boolean[][] adjacencyGraph) {
        for(boolean[] each : adjacencyGraph){
            System.out.println(Arrays.toString(each));
        }
    }

    /**
     * Given list of nodes, we draw a graph, adjancency matrix based graph
     * @param nodes
     */
    private boolean[][] buildInferenceGraph(ArrayList<NInterval> nodes) {
        //32-38
        boolean[][] graphMatrix = new boolean[7][7];

        for(NInterval xEah : nodes){
            for(NInterval yEach : nodes){
                if (xEah.isLiveAt(yEach.firstRangeStart()))
                    graphMatrix[xEah.vRegId - 32] [yEach.vRegId - 32] = true;

            }
        }

        return graphMatrix;

    }

    /**
     * Adds a given interval onto the unhandled list, maintaining an order based
     * on the first range start of the NIntervals.
     *
     * @param newInterval
     *            the NInterval to sort onto unhandled.
     * @param unhandled
     */
    private void addSortedToUnhandled(NInterval newInterval, ArrayList<NInterval> unhandled) {
        if(newInterval.firstRangeStart() == -1){
            return;
        }

        if (unhandled.isEmpty()) {
            unhandled.add(newInterval);
        } else {
            int i = 0;
            while (i < unhandled.size()
                    && unhandled.get(i).firstRangeStart() <= newInterval
                    .firstRangeStart()) {
                i++;
            }

            //this gets rid of [-1,-1] kind of intervals
            if(newInterval.firstRangeStart() != -1)
                unhandled.add(i, newInterval);
        }
    }


    private void printIntervals(ArrayList<NInterval> intervals) {

        for(NInterval each : intervals) {
            System.out.print(
                    String.format("[%s-%s]", each.firstRangeStart(), each.lastNRangeStop())

            );

        }

        System.out.println();


    }

}
