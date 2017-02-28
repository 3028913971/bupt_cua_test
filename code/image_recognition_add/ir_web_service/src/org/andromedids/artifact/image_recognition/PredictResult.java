package org.andromedids.artifact.image_recognition;

import java.io.Serializable;
import java.util.regex.Pattern;

/**
 * Predict result.
 * This class is immutable.
 * Created by DONYORIDOYODOYO on 2017/2/14.
 */
public class PredictResult implements Serializable {

    private static final long serialVersionUID = -3085876228017889317L;
    private static final String SPLIT_PATTERN = Pattern.quote(":");

    private final String label;
    private final float score;

    public PredictResult(String label, float score) {
        this.label = label;
        this.score = score;
    }

    public PredictResult(String wsResult) {
        String[] parts = wsResult.split(SPLIT_PATTERN, 2);
        label = parts[0];
        score = Float.parseFloat(parts[1]);
    }

    public String getLabel() {
        return label;
    }

    public float getScore() {
        return score;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof PredictResult)) {
            return false;
        }
        PredictResult that = (PredictResult) o;
        return Float.compare(that.score, score) == 0 &&
                (label != null ? label.equals(that.label) : that.label == null);
    }

    @Override
    public int hashCode() {
        int result = label != null ? label.hashCode() : 0;
        result = 31 * result + (score != +0.0f ? Float.floatToIntBits(score) : 0);
        return result;
    }

    @Override
    public String toString() {
        return "PredictResult{" +
                "label='" + label + '\'' +
                ", score=" + score +
                '}';
    }

}
